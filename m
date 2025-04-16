Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE362DFA31;
	Wed, 16 Apr 2025 03:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.144.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744774651; cv=none; b=jk5w0tK5iQ5csDteUweYCVxV2+RZAJkV4ri/T11JOx0zZiAuAwzejL6oei6N2aK2RcbHsKQ0EsB6hATaMI/J5Z3hyUo95Wz3sZVf1ovaaBTC5xTIrLREjea0C0TazeoaEKkcY60QneSyvWyumwSV8Ll+wj7GPytJqf5MdW6JOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744774651; c=relaxed/simple;
	bh=6vQH1CB4a3bJsItvGCdq4/8gsUWdHbTwwn/6tj0lSFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTuC+RNxv8qQRjMtJDW3uKLLfO1b06O7JSLbWxRMqSNBKYOgb+sEHP78P+NMoSIHfCDLdlgcnbMP3Ui2vE7TeGU2+NSONOFELjjbfe1S86aquUuDAFpP2idUzxJ1/C+KYJ/WWvCgVCdBRteoJiDh4DOG3VUdYxU0zDEOchPw6Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dorminy.me; spf=pass smtp.mailfrom=dorminy.me; dkim=pass (2048-bit key) header.d=dorminy.me header.i=@dorminy.me header.b=Escj1yUC; arc=none smtp.client-ip=71.19.144.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dorminy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dorminy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dorminy.me header.i=@dorminy.me header.b="Escj1yUC"
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 4595F81761;
	Tue, 15 Apr 2025 23:28:42 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1744774122; bh=6vQH1CB4a3bJsItvGCdq4/8gsUWdHbTwwn/6tj0lSFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Escj1yUCXXo2gjM/0SzRe6CVrewC0pVNiuOS0GzX6WhqQx0CjCmgNBI7leRGcDIW+
	 AeuhH39aL/DdlxQxxxtEzJbtjK8rVev+icY7jZbQWOPhnYgNQmdyQJHt//2fGuyThC
	 lr8zFx8vSB+XI1fzFtfWhoOfM9rTbOZHmhJsxC0IV29VwjtK4WHCE6Kmjyj3PiXE9k
	 XIZ6vqoS/8K7/pU3VwweqVyrCgoio0bSTWAE9hL7Fy788R0EICQxgsec5W68SwFq1g
	 u5AqPgkWlnoGXgd5518i7Qe5T7kLoVP2jAEAYct5TGUlUJXQIi16lekhObgdtb3pP4
	 bHIfZXeWTJVkQ==
Message-ID: <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>
Date: Tue, 15 Apr 2025 23:28:41 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
 linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>,
 Omar Sandoval <osandov@osandov.com>
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
 <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
Content-Language: en-US
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
In-Reply-To: <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/15/25 10:46 PM, Ye Liu wrote:
> 
> 在 2025/4/16 10:14, Andrew Morton 写道:
>> On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>>
>>> From: Ye Liu <liuye@kylinos.cn>
>>>
>>> Introduces a new drgn script, `show_page_info.py`, which allows users
>>> to analyze the state of a page given a process ID (PID) and a virtual
>>> address (VADDR). This can help kernel developers or debuggers easily
>>> inspect page-related information in a live kernel or vmcore.
>>>
>>> The script extracts information such as the page flags, mapping, and
>>> other metadata relevant to diagnosing memory issues.
>>>
>>> Currently, there is no specific maintainer entry for `tools/drgn/` in the
>>> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
>>> tools mailing lists for review.
>> Help.  My copy of linux has no tools/drgn/
> I noticed that the current upstream Linux tree doesn't contain a
> `tools/drgn/` directory.
> 
> I'm interested in contributing a drgn script tool as well.
> Given that this directory does not yet exist in mainline, where would
> be the appropriate place to add new drgn scripts? Would it make sense
> to create a new `tools/drgn/` directory, or is there a preferred
> location for such debugging scripts?
> 
> Thanks,
> Ye

I believe the traditional thing to do with new drgn scripts is to add 
them to the contrib directory in drgn via pull request:
https://github.com/osandov/drgn/blob/main/contrib/README.rst
