Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3D2260C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012493; cv=none; b=WHREQZ9oD8ELJimvMKE9CNfmcfVqLIKzQTxTqflGXBSOR62OlN4C40aJiq4sjc9se6v0dDfmcuEG1qiZFw6kqzuuOswPEZlScyIVAaLN7ar6lMTelioSzcowF8BdW0h988z6P8q2gz9hWHDHHQ5BEp5JYEVG7eOl0SXeTnU6AHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012493; c=relaxed/simple;
	bh=rQPkHVKCvmw5LrOb/v/cqXm3uOUme0k0Brv2OsGkKZ8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=stWcQOTvR7T9YPSJZJTfL2yxHEIga4cEkS/D0pl3YXWuBak3b3CKzpP2tptFTHcWxCaa4l5m04DtX+rXW+CsGXG5BuQ1vOLS30Rrt9SXzL28YCDfZ4SN8hosiYTHEiHERUMiC6+3jmeXf+Ql9FLdFTCoJ2aRJIViVkxspd+SigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dSHRJ2H4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dSHRJ2H4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9864C4CEE7;
	Wed,  4 Jun 2025 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749012492;
	bh=rQPkHVKCvmw5LrOb/v/cqXm3uOUme0k0Brv2OsGkKZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dSHRJ2H4ZMsx/7L5DpIKOCKBHMpa7KlEFV/K/XifwAh7BqyKRFr+FsfeVeMuU3hqE
	 Kkx5Tiyhc2FGo135XrT2vRO2Nqqhf69Zwmp0NuQ+AD0C2lX2emi5VkqIEhT6tHg854
	 3wovHiUPqv3mv08ISGdMGGIktHL5AVGEG9R2sEWM=
Date: Tue, 3 Jun 2025 21:48:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luka <luka.2016.cs@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] WARNING in shmem_rmdir in Linux kernel v6.12
Message-Id: <20250603214812.3c0e774ffa4700f47bd1340f@linux-foundation.org>
In-Reply-To: <CALm_T+1tHV6QmeykRwch602TzgJet+1dOWe25VSV6dw_Xo0SyQ@mail.gmail.com>
References: <CALm_T+1tHV6QmeykRwch602TzgJet+1dOWe25VSV6dw_Xo0SyQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Jun 2025 12:43:01 +0800 Luka <luka.2016.cs@gmail.com> wrote:

> Dear Kernel Maintainers,
> 
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.12, corresponding to the following
> commit in the mainline repository:
> 
> Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)
> 
> This issue was discovered during the testing of the Android 16 AOSP
> kernel, which is based on Linux kernel version 6.12, specifically from
> the AOSP kernel branch:
> 
> AOSP kernel branch: android16-6.12
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
> 
> Although this kernel branch is used in Android 16 development, its
> base is aligned with the upstream Linux v6.12 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 16
> platform and identified that the root cause lies in the upstream
> codebase.

Please just include all the bug info in the email.

> 
> Bug Location: shmem_rmdir+0x48/0x84 mm/shmem.c:3733
> 
> Bug Report: https://hastebin.com/share/jazumewiya.css
> 
> Entire Log: https://hastebin.com/share/uyuyaheken.perl

Those links don't work for me.  "We're sorry, but the contents of the
bin could not be found, or it has been deleted"

