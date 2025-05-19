Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A47260A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670463; cv=none; b=G6eazKxPfhDrRoGhVcpUC9PT7akdU084tg323p089FpG3pj3hUfRAe/MFv/LGVzWmA3Zq7i0MDzHvY7FOHTwttPR2Lv9sKGFt98keYPP20sbLmJLEPn7sgB3SJCo4Gc3eU/XiNU+KF5BxhZFgT0S0cFdED6B95oaJUMrtswzrgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670463; c=relaxed/simple;
	bh=IRzJaoPvZCNgs0a0x3nP5Ngk+LEMe0MKIMoVYs7geWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtPnCPj1mvx61B2jQe09iOP2Wh1Es7GTDLuKsAvCp3dFMRUCd8sMZtbE6ppreCkQlUhsm/FhW7+e/009ZipryHJlgolcm3sMm3Bke/w1P2vs891VkEbj9nIFwumlxyp4STHpx47tAFBz5BI8efmElQGkZmgyA3TtIftq+1rfgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p6SetpCB; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p6SetpCB"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47666573242so685391cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747670460; x=1748275260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vk5UECDnxcbQWnHyIDFhExQ1Vexoa4EZtKehLd/4jY=;
        b=p6SetpCBPBNPraW/VCZ0wjY2hVX/1rbg0ULST6S+0gC9VPK9goHN3BumNtNaahhYil
         uFn3Vb8i73ifH3tvXz0jpHbtHIDVJw3ha254l/AY87iIcA7ploWubA4/EQfeG27mbDky
         Tqd1/nxVu6ePCM9daEf2BqM/aKpOURPwybJJqYNnwpr3hV68oc/De1LlImRrf08aQjvJ
         DBFe5w8E0mkCdxpjoP7R3O4tK+K+kYpmB50XD6vo6uqGOASXpPzfqfg6nnMo6J0v8J3w
         G+f0SVX2CqTfal/Vk2U/zA/0OoIdZg1OLoOXuvHP2jeUNFeb1LQJROiCNzIWYy+VXdJi
         htgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670460; x=1748275260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Vk5UECDnxcbQWnHyIDFhExQ1Vexoa4EZtKehLd/4jY=;
        b=W0tSQ1LZBvdH2uR/VsDQQeQDlT5lXvW20XulCAQOqaY03agcXJf9mQKveD7CU3X6cJ
         Ydc7DCQUs+rVhH4w1tAta9N8z0CvB2QxHmS9sFZvImHYX9EFgrRKKIFcPUo8950k3hy+
         HSqyDU0QCGPjeIIW1P3M4PoE91pGkvQxzbXFwzMcMUNzbNLSQ4GAmfqGGjcrUwiHqOQ4
         qpDcBZLuUs4PrLHTKZgwDL6V3CUAn2eY1kGH2YtSJvETZF4TGkMyizlz8/jf5/BhBDh9
         ICDlkA2skSYEIRf1/PzBAVGu9v2bnFLFJsrFSm58TYbgcQt/LOx++/WM2WLnMyCMPZMu
         kVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRkxVJh8TdQCS9/Ske0FCwxUmXEvI5MUeCOS0AnnYn3mz1L8fHo6e3rkOsBdOop+f+4zOy6a68qmHMKuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5AO/YyIG8QsFyi2AZPUkIi1SFscOv1x2ibEnXlbnPo4udzJWN
	uV3NknWxP+DdrxvubBMQqjBHhHsNtYYzUw2yT9UIzmYHBbFt03BSS85zA+IL4/xH4JlHLkGBv/+
	kRe8zAduO56Pc9nNx5UzZE6WuG4MITQxM4JTkuPwV
X-Gm-Gg: ASbGncvtoYC7vqKfd1LG/5j2QpD4gTRcbMc/1QUpQ63H5fvtLcWAFEFTicmf2+KGasL
	/iMb2E1UO4QYAR+IRf1M2JD5brbwEZfkk1FrUIdJtio/sCXodwa1oGNanJeVqbR97gIYm9Qc0uN
	n34396Ia6fmPxHl2w0uSM5He/jWiiCYmk=
X-Google-Smtp-Source: AGHT+IGwzH7DfuY5mp6BefgIj9BTKVFTlfepLxckJGGzF8UUYseL5yKVQvTSbahQ66L628RsaBaiAUoOc+KcN8yWNxw=
X-Received: by 2002:ac8:5781:0:b0:47e:a6ff:a215 with SMTP id
 d75a77b69052e-495864e985amr7597451cf.0.1747670459761; Mon, 19 May 2025
 09:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com> <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
 <CAJuCfpEfSr7a911zNiigVVP6Z20gjks7Yyy27UDwL4s=0P4hKw@mail.gmail.com>
 <6646d582.18f8.196dd0d5071.Coremail.00107082@163.com> <CAJuCfpF=FpMvGGzVr5E+9R629SfXB8oWm2NbowHg=mksUQ113A@mail.gmail.com>
 <233aab47.38f2.196df28812a.Coremail.00107082@163.com> <CAJuCfpEPupOzygXhoYBCzTao4YHzW9ZWG+Y4KDUohhfq=hjwQw@mail.gmail.com>
 <5a1f5612.363e.196df64bd1f.Coremail.00107082@163.com> <CAJuCfpEWsN3pxN2EveACvucx7Aip6u_YjJ5u3NxdmU3A3WYOYw@mail.gmail.com>
 <551cd408.515.196e11108a5.Coremail.00107082@163.com> <489a2474.19ea.196e2d20b87.Coremail.00107082@163.com>
In-Reply-To: <489a2474.19ea.196e2d20b87.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 May 2025 09:00:46 -0700
X-Gm-Features: AX0GCFuY9pqRmToI9UzuwAkqWEVNpNKh5fnk4HzxVmhR6scob19OeLSDvHxIY_U
Message-ID: <CAJuCfpHprFd2i92QfM+bDQE06eS79Q=CKQJ7GH-Vs3eBBi-yVg@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 2:55=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
>
> >>>
> >>> I do notice there are places where counters are referenced "after" fr=
ee_module, but the logs I attached
> >>> happened "during" free_module():
> >>>
> >>>  [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for addr=
ess: ffff9d28984c3000
> >>>  [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mod=
e
> >>> [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> >>> ...
> >>>  [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> >>> ...
> >>>  [Fri May 16 12:05:41 2025] Call Trace:
> >>>  [Fri May 16 12:05:41 2025]  <TASK>
> >>>  [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> >>> [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> >>>
> >>> The call chain is the same as you mentioned above.
> >>
> >>Is this failure happening before or after my fix? With my fix, percpu
> >>data should not be freed at all if tags are still used. Please
> >>clarify.
> >
> >It is before your fix.  Your patch does fix the issue.
> >
> >In my reproduce procedure:
> >1. enter recovery mode
> >2. install nvidia driver 570.144, failed with Unknown symbol drm_client_=
setup
> >3. modprobe drm_client_lib
> >4. install nvidia driver 570.144
> >5. install nvidia driver 550.144.03
> >6. reboot and repeat from step 1
> >
> >The error happened in step 4,  and the failure in step2 is crucial,  if =
'modprobe drm_client_lib' at the beginning, no error could be observed.
> >
> >There may be something off about how kernel handles data.percpu section.
> >Good thing is that It can be reproduced,  I can add debug messages to cl=
ear or confirm  suspicions,
> >Any suggestion?
> >
> >
> >Thanks
> >David
> >
> >
> After poking around logging memory addresses, I think I finally understan=
d what is happening here.
>
> 1. codetag_alloc_module_section alloc memory when loading module
> 2. module load failed, due to undefined symbol
> 3. codetag section memory not freed
> 4. module load, and module's address happens to reuse the address previou=
s used
> 5. another codetag_alloc_module_section
> 6. percup section allocation and then relocation address changes made to =
codetag_alloc_module_section
> 7. unload module, when searching through maple tree, the code tag memory =
in step 1 is used,
> which has no relocation address populated at all.
> 8. page fault error, because tag->counters is 0
>
> I use following changes to log the address,
>
>
> The offending address is
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -575,6 +575,11 @@ static void release_module_tags(struct module *mod, =
bool used)
>         if (!used)
>                 goto release_area;
>
> +       struct alloc_tag *ptag =3D (struct alloc_tag *)(module_tags.start=
_addr + mas.index);
> +       pr_info("percpu 0: 0x%llx(0x%llx)\n",
> +                       (long long)per_cpu_ptr(ptag->counters, 0),
> +                       (long long)ptag->counters
> +                       );
>
>
> And got following:
> [Sun May 18 16:25:47 2025] percpu 0: 0xffff8edb6ee41030(0xffffffffbc57e03=
0)
> [Sun May 18 16:25:47 2025] percpu 0: 0xffff8edb6ee410e0(0xffffffffbc57e0e=
0)
> [Sun May 18 16:25:47 2025] percpu 0: 0xffff8edb6ee40fa0(0xffffffffbc57dfa=
0)
> [Sun May 18 16:26:43 2025] percpu 0: 0xffff8edbb28c3000(0x0)   <------
>
>
> I think, we spot two issues in this thread:
>
> 1. when module load failed after codetag section alloced, the memory woul=
d leak.
> 2. counters may needs reference even after module is unloaded.
>
> #2 has already been addressed by your patch. I will send a simple patch t=
o fix #1
>
> (Feel so released to finally draw a conclusion, hope no silly mistakes he=
re  :)

I see. So, layout_and_allocate() succeeds in allocating the codetag
memory but during a later failure we fail to free it. Makes sense and
your patch looks good to me. Thanks!

>
>
> Thanks
> David
>
