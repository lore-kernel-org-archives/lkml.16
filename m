Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7BA923
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746326144; cv=none; b=Q2JSidhcc5anUUw6H0DHD1uqzmxJn0GJQOINvaVPDoxUPaikWOfauxxp2+f4jDiMlh4nmnbq9slIY/RKO/TzmAzRrzlk87YBB5CeUQy30y6uONvygpdhELztbOAJ/bUeFYSSaWOYzff1f6Sfg1tPJ3qCWzGHtOgyw/cg4qj26vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746326144; c=relaxed/simple;
	bh=dP8W6A/O/T4/FUaV6gaNng7TLGyx6PR6EmugVLSIdoI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C3Q4bkQxB5YJnEwnrKOMX4YhenBSsurgE4RqZLF7y214FawgkvWdU4D7RRe61L6sPHLtiq5KNhxh1uYW2+gMOtG89CthYXqtyiM6Pxg++fsLgBahX5xSbMO2mMOMbJoKj89Jae4eGPXtTYOWLC+QGMFr9tbhwXTV+OAZKzfN3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zMdWEyjI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zMdWEyjI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48763C4CEE3;
	Sun,  4 May 2025 02:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746326143;
	bh=dP8W6A/O/T4/FUaV6gaNng7TLGyx6PR6EmugVLSIdoI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zMdWEyjI8ju04rFzSdNB0qQXJwN5ZgjAR+xQtH6+iVRLhVvIqMpbFhaYMaN8KNOr+
	 fUUFLNaCzz95k5zem2UDad1FjWRKulTi+LQHSOyQ0jy/61pcPmBu+kT7ISjFVaNZ0t
	 1pNQm6erOeivJLVF5LdwmiQidD4M+V9Hn90maI8c=
Date: Sat, 3 May 2025 19:35:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] list: Remove redundant 'extern' for function
 prototypes
Message-Id: <20250503193542.bd707ba88b542bb797fa49b9@linux-foundation.org>
In-Reply-To: <20250502121742.3997529-1-andriy.shevchenko@linux.intel.com>
References: <20250502121742.3997529-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 May 2025 15:17:42 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> The 'extern' keyword is redundant for function prototypes.
> list.h never used them and new code in general is better
> without them.
>
> ...
>
>
> -extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
> +bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
>  

I'll apply this because you continue to do significant work on list.h
but I don't want to spend the next 5 years buried in little "remove
externs" patches!
