Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3418A6A8;
	Thu,  3 Apr 2025 02:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648945; cv=none; b=Mp0nO75mkIufglB1l39VXyNKWsxohn2+MdODx1we0TSBJ0wGFp3aYcuFFc0ogbF6TAfjzbxfqCehBoUOe/aKsZgttUVunfG/1VETlPurJubNqWjM9zui+aav/gBc8BzxNUW6xJbpsGoK+mWXh/awkUB4Y0dm4WlwMh4nlCvL1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648945; c=relaxed/simple;
	bh=BITdy43bRUZTRjGwrBwWQp8CTmIftj2WMWZYghMkCow=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g/L4hJKu5lJnBJ78anXsbjzPIVAq62TcrrafYihQVIdRZ4QFeCP7TzQ+x97TGpyvSjuhQ4MZw3V5P4vwc16i0gsadj6/bgwiuk0HYAHKipnrvtbE2gChTMRsrfFKQB9yrg7OY2hdrXefHRwkPZhTcsYMpVROkfkNNY0Pt/AeAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A7Tgbvp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A7Tgbvp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3619C4CEDD;
	Thu,  3 Apr 2025 02:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743648945;
	bh=BITdy43bRUZTRjGwrBwWQp8CTmIftj2WMWZYghMkCow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A7Tgbvp8P7/tchMbbbaufItibLsrtUJGm3AGz9SLfde+LhWTq5FBt2NPgJi8UVxXz
	 Oy+HADDN15ae3aUYnamqyeXedtO4nb9YlKLH1tZ8vfp12XgDLzCWpz8154AouBsP2E
	 0A3BoT4O9blv5OIAhCpUseg/kowoKHFShBY48bew=
Date: Wed, 2 Apr 2025 19:55:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Francesco Valla <francesco@valla.it>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Tim Bird <Tim.Bird@sony.com>
Subject: Re: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
Message-Id: <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
In-Reply-To: <20250316205014.2830071-2-francesco@valla.it>
References: <20250316205014.2830071-2-francesco@valla.it>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Mar 2025 21:50:15 +0100 Francesco Valla <francesco@valla.it> wrote:

> When initcall_debug is specified on the command line, the start and
> return point for each initcall is printed. However, no information on
> the initcall level is reported.
> 
> Add to the initcall_debug infrastructure an additional print that
> informs when a new initcall level is entered. This is particularly
> useful when debugging dependency chains and/or working on boot time
> reduction.
> 
> ...
>
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1214,6 +1214,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
>  		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
>  }
>  
> +static __init_or_module void
> +trace_initcall_level_cb(void *data, const char *level)
> +{
> +	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> +}

Please review and test this fixlet:

--- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
+++ a/init/main.c
@@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
 static __init_or_module void
 trace_initcall_level_cb(void *data, const char *level)
 {
-	printk(KERN_DEBUG "entering initcall level: %s\n", level);
+	pr_debug("entering initcall level: %s\n", level);
 }
 
 static ktime_t initcall_calltime;

