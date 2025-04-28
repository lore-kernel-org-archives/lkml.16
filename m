Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6727A13A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857851; cv=none; b=UVVQV7Sp5cSKhof++3VBVLdPWVSUW+FoZLVrk07XxH6Kmfz0UrchJMp7QAdwXTf3F8leO4YSIqFuGXlVI/FNFVE1ou5CCWNn2xcDNnmUqLgIVfUY5TXhi4g+ib+SvmSyIPuAQyDqi/dDx7Jep9P2Vb1Qt2L53Bdk4EJzMkIoK0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857851; c=relaxed/simple;
	bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=naYdMVPs7J9o3RZuDyrhqZHbODVkqL4304IO4FA544j60/9brDyJsC5SZ8WBf6hZvITG8DYBc3liMuDn8dlUwJer3p3OPtWRCMbWR4NJsLuDSKvWDvGuCnT604Fy43bhRn2Xvbt+MubhrJ7pPImQm+lmXROqsOw/eM+yFAp8rL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L7fmLXz1; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L7fmLXz1"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47666573242so251cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745857849; x=1746462649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
        b=L7fmLXz17BACjBlzTpAfNvAfQ8UXmug2eWrWnwv00a31n8jpY9nfL4GJ7TlDbs15QQ
         BdkXiaGgDfDYtdvyNkJ23qfPypYVONEl/LbdIRsPqUFrcoujvEwmB5BmUT/fFjh5zLTS
         6wZIDmQOAE1Wo42XStGFdfUm23T3HnSVOXspfkDYAH6bpFTcvdnPOh24kqnRadyczmCX
         H+TRK5HK71zPOZfmyU1QGO0qENlk/UVloyB+iwWzTJM9s38TfBayWcpyS9vaDu0IjisR
         8uPGX/Lwbh60JMO7SMzmJPsgYC+rY/v97KkQ3vpyLqs2iWLMBG1S/C4cd1L0wSkRYPom
         n71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857849; x=1746462649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
        b=B/5SuUtGIKOZ4PPye4KE5LXhB4F3ioNCOQUNkcBBaz+EnjFvyiOJjq03lEOFGjyvf8
         3OWBe6NA1G9dzZYkXT/lHTCukoHbEcsJDHmV9GCoHvSrLkYYKtTVaZVxdjqRJazlSMep
         ahcURddbuGVt6ehhDpfzvGW2zmgPQ/A4QE0kzX/l3I8SFJbUoWbOKBZLvDWy3IdL4nnx
         nZ7/vZoUhmW+ZBCIloBcQ/7JpdQwEp2sbtNPJzdfcREumKKIhm52A7KHstp9necKknV7
         HvTU95w+lkJ1HA0T788M4SLWN1Zv0NhdWc/Qjiyj7QAOPlomBC4yRZB6isi7Y1J+NGzv
         KphA==
X-Forwarded-Encrypted: i=1; AJvYcCW/s1sgJc1Ll5dAjAmIKlSPgpYYNegUnHIry9hEtu2k9nWoEI9LDbPt5GC7BjKUa0SBqXobXUFKrkKzn7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAs0eIOiYzi/LptTjliBXH3QrxA92N19/s8YSBoZkIaPQ48SU+
	g1EzltQMHlAh6xct8JmCOZXJjf5SKQwKRT4FC+/qrsQraQSfYcIgfZwNXtN6RddYgQv4XJl4Y9J
	SGbOrI8+B3o/4qRFRMWKX3oGVcIDnm3mN4WO2
X-Gm-Gg: ASbGnctilgtlM30bskPj/hCC1roX8Q7BiYxF+9fLaKaifkLf+9VkRXoijA+j5FhuNKA
	TeiXXYBbIhr3Xh8VraR9bzzJZ2EYR8OLg5qodNSNk5MKV1Wu2dMMxQ8LvK1u3g22iCtUHxs9fGK
	9/CK+o2Dpi++o/wFQu/PGYKvx/9KI2boE=
X-Google-Smtp-Source: AGHT+IHISK1kxrYk4RfbziCnCnzPWCd0oWI+e9SVH/lBMnDhpa52pdJdvOhZCLc8iwRh9PYrrSIzc0NhpiEDqA7CwQc=
X-Received: by 2002:ac8:5d4d:0:b0:486:b41d:af93 with SMTP id
 d75a77b69052e-487fe63bc50mr533301cf.20.1745857848688; Mon, 28 Apr 2025
 09:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174491712829.1395340.5054725417641299524.stgit@dwillia2-xfh.jf.intel.com>
 <174500659632.1583227.11220240508166521765.stgit@dwillia2-xfh.jf.intel.com> <9a4b347f-9a18-4578-9031-0d1bc98e668d@intel.com>
In-Reply-To: <9a4b347f-9a18-4578-9031-0d1bc98e668d@intel.com>
From: Jianxiong Gao <jxgao@google.com>
Date: Mon, 28 Apr 2025 09:30:36 -0700
X-Gm-Features: ATxdqUELDAnyO3GkumJUBV1EJePzSaA7vBfrlJPvUNeMSl7GggLRW3jYHMePSec
Message-ID: <CAMGD6P0ORZF6Tbkuedv99jEpk+6HjG=pyqCwTHKU5dVxt+kRCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/devmem: Drop /dev/mem access for confidential guests
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, stable@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:53=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> Would most developers reading this know what an "SEPT violation" is or
> what its implications are?
>
> This results in an immediate exit from and termination of the TDX guest,
> right?
>
In most cases yes but it depends on the settings.

If TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE is set then the TDX guest
is terminated immediately.

Otherwise a #VE is generated for the guest to handle.

TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE is disabled by default. See [1].

[1] https://lore.kernel.org/all/20250401130205.2198253-11-xiaoyao.li@intel.=
com/
