Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA08219E4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236106; cv=none; b=q5V8WF/4cnnSnj7mh8RQtKOvegMI0eplE92jGfVF7EzrWotb3QftdNbjf43BbO/nuyQnQhRNn1S7DFpAMRR8ygWhB68hINw5EhkzNflvy+3KOUpMfQC6pP5q7lk87rtX685jE9wiCbZiLBkifu4eh5Tn5FNKUnt6OLkcY/yECuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236106; c=relaxed/simple;
	bh=aqm8chgeUHE9w7V6OzdaFcFnAZV9Anw5fN17DWsCSJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4kw+TU6UGaN3573TCnM9LICOPPvOxKT8w1QJrX7PEieUMamYfX0n6pjPyQGzRoHT9oz8g/nN7rx3vdZ9bZvT0TAsH2MjWaiXkV4O96rJH7OAE6wtF8LlxSHeTN5npjK+IYVueND2heS03bhmR2JSt7si3nSMHDP7SXNAVMtm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JsRIRuio; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JsRIRuio"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e39fbad5fso211925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747236104; x=1747840904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5kkfSfbrLWrkERpgfX2DFIg4PKuqh/HkLXjbsJIBtM=;
        b=JsRIRuioQ495Qd3nepF0Bc6CIfxhBkn/YI223RIzJqB+OX2sfcvKoAI/h5xqQbIeZU
         SISxBCVYFlkkLbLEpdXlcIcMVfix7EM+mbEop1GW0rr/E97ygGVqz/w7GiisNeMFkuGg
         fCK+3YEAjeRsts/RAuQ42lfuLqECNb92h9nbTOJUh62xBPClcLk8HeSgXo9wNvbl1e6h
         DIGHXL1v5SJ/Lnt/hCbL1oFBIVU99MYy0m6Lf4BNErcIfln2ACDwPcWSRxEHkf0IMX7n
         1eREBE253YnGHO9PQsmSc8t7eCrMRUQioLhyiQS68cpCN4VNTjZTk7kFpzBXXd1NP8yM
         8lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236104; x=1747840904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5kkfSfbrLWrkERpgfX2DFIg4PKuqh/HkLXjbsJIBtM=;
        b=L+23rfm19H0JFUh3rthcwyf2CFVW4siDNTE1JRBwuP3zorwDJ01XUngXjdgDLBwpxm
         +TkrYdlNDCp6TLApmnMq3Wf+hXPmNS3yLzWjokVaB11uhMtl0HnRrmbaWBGuxhEwEsej
         RA1gFRGANEV303Ujr6m6CbNsqBo9gpYv5EZ9/fSOQ150pWYR33S10Z+kmsh7n572+Ly3
         EUUC3TcQK8LakvlqDCyS/GtcA0EsK7ttQW1PDpvydeTYUfvjcmt7oL7ALmBlrvig0VZR
         ne+LmaPTr4lwJqF3wsmE+S3z960dTXjEMAkOZSdNNIopI9TxeTlHO/fOGmkkEOk4eG4Y
         8OKw==
X-Forwarded-Encrypted: i=1; AJvYcCXd2FyG9CmCb7CwA2wv4bK0zjzlc2Q6m8gFUT35mYBWU/vvCToLgpk6qx+i/3v5rnW45cTNsmHm6oMUiUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4aifTEcUSzsk3fPZTVY8cSNZ3zj4N6iETC+oBTCnsbrYOveQR
	RxTFBmsyI7kVNxi7Ti5qwKiSwLsSUPUoWP/wnczL8LNosARNntJQcOueehaoXYX1cVghOAwsSi9
	7x8X2uF9RI4CHd62yLkWPgIDDWQMPokHnlMCRVEuK
X-Gm-Gg: ASbGnctzTAc/Zai2+jWB2kktIoSYiL6Z8OFC9ZCp75qH9ZmIAuI+ySzfbyeD6RD9P/y
	GOwNbW7Sh+65bf9QbQDpvE6CjSIl6B0A6Q4RRG7y8TF7pg0o4Ft9cuvKgoryHBsC06BNLo+UUzh
	z35A78ReEdKzFqed5zuFeZizSxTcbUq1D4M/TDpwmqJTjUl++TI9nLgLIrZdzVflDCLw==
X-Google-Smtp-Source: AGHT+IEDFjAEViaETl+HXGG3nCMSzRvQ2B8Cbr4reJBBfbEw48+Tr0BGQ9AFALmBDU3tuYflnPtNSELVDngmLibLraQ=
X-Received: by 2002:a17:903:1109:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-2319909c216mr3419965ad.14.1747236104067; Wed, 14 May 2025
 08:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
 <20250502130828.4071412-12-kirill.shutemov@linux.intel.com> <6a7f0639-78fc-4721-8d84-6224c83c07d2@intel.com>
In-Reply-To: <6a7f0639-78fc-4721-8d84-6224c83c07d2@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 14 May 2025 08:21:32 -0700
X-Gm-Features: AX0GCFscmcl35uOjE18U2ra8ong5Qbdrs0qjWEtEJdayACylFUy94ngUS-DfONY
Message-ID: <CAGtprH--e6i6b9grOLTUwYXKSNb=Ws5sNPniY+oJpyctM1cdTA@mail.gmail.com>
Subject: Re: [RFC, PATCH 11/12] KVM: TDX: Reclaim PAMT memory
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, pbonzini@redhat.com, seanjc@google.com, 
	rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, yan.y.zhao@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 6:12=E2=80=AFPM Huang, Kai <kai.huang@intel.com> wr=
ote:
>
>
>
> On 3/05/2025 1:08 am, Kirill A. Shutemov wrote:
> > The PAMT memory holds metadata for TDX-protected memory. With Dynamic
> > PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX modul=
e
> > with a few pages that cover 2M of host physical memory.
> >
> > PAMT memory can be reclaimed when the last user is gone. It can happen
> > in a few code paths:
> >
> > - On TDH.PHYMEM.PAGE.RECLAIM in tdx_reclaim_td_control_pages() and
> >    tdx_reclaim_page().
> >
> > - On TDH.MEM.PAGE.REMOVE in tdx_sept_drop_private_spte().
> >
> > - In tdx_sept_zap_private_spte() for pages that were in the queue to be
> >    added with TDH.MEM.PAGE.ADD, but it never happened due to an error.
> >
> > Add tdx_pamt_put() in these code paths.
>
> IMHO, instead of explicitly hooking tdx_pamt_put() to various places, we
> should just do tdx_free_page() for the pages that were allocated by
> tdx_alloc_page() (i.e., control pages, SEPT pages).
>
> That means, IMHO, we should do PAMT allocation/free when we actually
> *allocate* and *free* the target TDX private page(s).  I.e., we should:

I think it's important to ensure that PAMT pages are *only* allocated
for a 2M range if it's getting mapped in EPT at 4K granularity.
Physical memory allocation order can be different from the EPT mapping
granularity.
