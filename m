Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C11A7044
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761645; cv=none; b=JATLuVADMpD9X5n2DANuqOp8yn4IJcr0yOvitSLyCyBaFPFqyO2GYLH3cEpjflsDSeKUmRigBCBBvmL2HpYkxtsCcr5WixQM4Uhzx4kgVoJIH9tW0CcNhvs8fNmuPMTS7Sdo1Xut/UUVyduDKlFxvGdN8SFN904mDMB8nWiaehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761645; c=relaxed/simple;
	bh=M1xR/ehUTlCqt5flnpbVHWZfT9TJ+6ACGN3OWuyHfIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLIIF1LJhJUKVfy9sxTHnWn7VPwJlb5WObvRoC83o5Y5rhEpqpCN8+DCGCNQQZXXYufNp/uRbfQirmo+K7c3t+eweiLmo5FiJivdY+zOjnSDDkXI7MGulFpf/Pxz35RtNx/R5CegxFBYYv9WCtvvpFQyLET91SN7VrF/x1QmbuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTDIWdMt; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTDIWdMt"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523edc385caso834544e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743761643; x=1744366443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6kQX7J4iPqcH4qqAuoXo8W2m8I6TgoA5VFu2BQ2/J4=;
        b=bTDIWdMtAGoididzVD0Van1KJBR7RTgCrLsgm88hIqpAMPdpqJWHq/MeOeBrwy/9VO
         HI+/gHeY6IBSz/7VM/RrzLqOPPEJZTf2HAm37WjlARD+qHc3XempV2nCMv1nL07h7oXR
         7xl4MALT7EutIYCH6lC6izTrJUicIhgv81rEvu9Ve3VNcWuMCQT7mL8LW9dbsOvBL2bv
         YzeporgCu4yYdqJC+iwtBWFJDeqglEQAgncoGP5qkY1Imd/YDglGRLkUaYLiS1m1ljQj
         FyAVIL9KqU58601bjLJROf4wf+N32eLNYxBhNQGVyE7DKFZ7RK/wFHebIFicdqKQgcgZ
         gKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761643; x=1744366443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6kQX7J4iPqcH4qqAuoXo8W2m8I6TgoA5VFu2BQ2/J4=;
        b=A9fc/IXCk11k4fVPEK3Idbp2mW9s/z9dQ5H4lVjmWg90cOE464lRHny0SlFF2FWPdj
         wsS8nKyGdbmNz3J2hjmDTro/fkd31f3LiTAVIOspEBhdhHP5ggpi1f8dBkSZxRR7k+8a
         t2jlTP+reBfEFM//3uFDvanUkav14zcV3Yo7FxfJT40TOXAj40s3+fjy0CH2RoHJzSDu
         FiUbH58b91fwvfzbN3BNVkzIXcENPkk+n1bqUIwftcp/alEUpI/n1mWeSa89/8Y+sSIl
         Le/dykvnoC6OjW23guoeOGMY3VxQSy/YVEMX7clObTI2am212GfU5sFbLGbFCRzTXRrp
         jHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUAk9JPIIJg6ohNi+yuO/RJjxamZtjPm3hXISpFiv7PtX8d4ovaBxeoNkpA1s87mfEBWFsJaQqJSsJ/Tgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTeJ42Zt1NhphigzrZ+UipiGJpKOwCHKnREQ3NKisN+BIa6SwT
	ACPLVkruPM8zykWIPJaIj2LqGI8PxbjSI6Y9gPYvxZUGiMmxyqDHHYsaxgWTEmGyYZTUED17iXy
	ObZHkJalwBfA5hrhiECSwXN/W2VI=
X-Gm-Gg: ASbGncs3U1p6+sWO+FUiXXnwaBeicit3aKlT59g/sFfugU99fvJ5mZm/sYXUWiL+Npo
	NftzxjHfwh7AXgq7+w5j1nvJo8XmhSDwz+JYA6QzGc0hnC1xp2UskhaxUXLojIIzYXqtkVDSWmq
	NxlOUFcoa4uv+/lnaBXyI0azfKBZCO10FWQBkEEA==
X-Google-Smtp-Source: AGHT+IGHJ+mgde1bUNXVhTgyaQjWuFJcTsikHax7jYFsftnczff4N6TcT+1V1i3kwufL5PXiMgJCDcJcyRn2L3U7q74=
X-Received: by 2002:a05:6122:886:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-5276458254amr1626212e0c.8.1743761642817; Fri, 04 Apr 2025
 03:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com> <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
In-Reply-To: <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 11:13:54 +0100
X-Gm-Features: ATxdqUHTYgCeSt-ecqfOsTN05l_d53aRnie6hB7s9Rdi_fEEr2uHtQiBk9h1w2E
Message-ID: <CADYq+fYKHsZCBN-z4ogcnAC_gK7i0P1=DHbfm=AC8o-uSUQ-7g@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:06=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Apr 04, 2025 at 10:53:22AM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:
> > >
> > > When a value has been tested for NULL in an expression, a
> > > second NULL test on the same value in another expression
> > > is unnecessary when the value has not been assigned NULL.
> > >
> > > Remove unnecessary duplicate NULL tests on the same value that
> > > has previously been NULL tested.
> > >
> > > Found by Coccinelle.
> >
> > ...
> >
> > > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priorit=
y] &=3D 0xFFF;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (tx_seq + 1) & 0xfff;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (pattrib->seqnum + 1)=
 % 4096;
> >
> > Logically it's obvious that you need to align all cases to have
> > consistent approach.
> > Besides that the commit message should mention this change. Something l=
ike this
> > "While at it, convert '& 0xfff' cases to use modulo operator and
> > decimal number to make the upper limit visible and clear what the
> > semantic of it is."
>
> No, I'm sorry but that's really against the rules in drivers/staging.
> Don't mix unrelated changes into a patch.  It needs to be done as a
> separate patch if we're going to do that.
>
> To be honest, I don't even want people fixing line length issues or
> adding spaces.  I would have accepted small white space changes but I
> prefered the v2 version of this patch.  Once you start changing
> "& 0xfff" to "% 4096" that's not white space and it must be done
> in a separate patch. I use a script to review white space patches
> because I'm always nervous someone will slip something malicious
> into 100+ lines of reformated code.  It's really fast to review
> patches with my script but once people start mixing things in then
> it's a headache for me.
>
> Also if the change accidentally introduces a bug, I want it to be a
> one liner change and not something hidden inside a giant reformat.
>
> regards,
> dan carpenter

Hello Dan,
Thank you for your review.
Please can you provide some guidance on what the next steps should be for m=
e
as regards the patch?
Thank you.

Adekunle
