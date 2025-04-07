Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CD21C9E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049211; cv=none; b=X/5ICNJncW+DIzr5R/dkS7TyJyKbpXmxfohUcso+Q1EG3f1DDGci8S0hX+4Ypm7/M+sgxXGRsIYuIqHzPSaUKT83O3D9+ddPeIk16a8JakoJzEPdt2WImbP1ohPv5T2qrFxJc79ZU84kEDkFI4/Q11fk9FeEX+Ik05aeJdkme9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049211; c=relaxed/simple;
	bh=/QL2Deg67baZmAbZ/a+IO0SqdLa/xoFdNNCtzMrZm1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nu+jpRFEuK9I1OufuZ7ENHRs9LjCSCw9nqMChTtsDBkaJ6NZ7CW712r3YqH793Rw1CNnMIklUtTzhbW4yMDqC3J/PBMYYBWOTnxQ4825VoU8UbvanHyMOva18QTn+UcTFDlJYWlxT83Q1iWm93af86Y2XAo59iD6AGThnonskJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGC1U56a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGC1U56a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2f391864so2605321f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049207; x=1744654007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrEaB9L3JJCWImgpqc6St8J9YBdrcTfemPWf3LmUw3I=;
        b=UGC1U56a/NQiCAK4n8mq4SgrojErRKE3i0wC0JTujs0mxW76d3gXC8E6McutzRPFNh
         rJnpbQ9YmPj1IQ/b7C8b8XPAJyuK8KGIE9wNr1LugEGSgBwbqHTFB5uzY88gGpEecsUk
         /9IjonHoUOBn5/fOa5S8BEc5S78nfjIVmAeuMEB9uwoqyKKCUSj6LGRqWk6uzPtf4MmY
         tMv7aYqbl61FF7bQkjeNW16NFJNRQAgPLG0kgKMxp4gvbQtc1RJ3a7V1ulfq3/ENZHCP
         IjtllP/OcvLCz/j/AOkFu65mtriGP3qj8ApETnWPiErNhfkihcVH+3ih/SRjYLAOeU69
         diWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049207; x=1744654007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrEaB9L3JJCWImgpqc6St8J9YBdrcTfemPWf3LmUw3I=;
        b=Yw+iFx0LKSOxBbTIEvyk4mlqvgV/7TiRy7TXyJI0NmM9sHQ+E83Zn6s3+11AJZwK5T
         FXaLQsmhj16WsRZfx2JrFT4JgmdYKR+YQoUiDDgS0yWGsimCQR/xoaQc4dG1vzBHyAT2
         FMaPFISSc0pg9TS3BF1NHnZmR0NQgYDeNHy6GyUHRmX/iDobt1BQeuTUplIGE+p4enzK
         WpndrhVxGq3HCsrSk9wgvsQcqCUkSZ6CteOGDR6ZHkbDj7GAwiSXQfyTOhq6VfvUIjb0
         TawXhJUmRuSLx/aqX129nDscT/3CkMlXdg4ZWqEV/+hqvU20GCuwbvjb0Q7CPDXV49NU
         yWLw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjp1MbGmEROjvkUZVgor6b6vQk9qHhvRHOrfEfl+TnRUpXyOA9aU63HwLyDIoNz63/UJ5bkpwLYXXQx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzau+s6gWnbp5LomxWsEADHfnpKMNTCSpUoB+Ej6hQCKkZiOmcL
	Ls7ob4fGiZAvu5YPgk1BI6txbvtqC7AhYGoaLfyZgaDgX2FaSfRq
X-Gm-Gg: ASbGncsmH3LNObg56c+Na5bHO2u2FIov84sJVTpvt2ZGxX8tHwWcGZ5Z0cjTIlauVkj
	GB2s1MscVPVtATXIgouw/ALWqpbZzYIe2dNYH21r74xLk4S315DbZtjTVFsOkihN8TJAgZDVPKa
	IQdRBPEwBpYjwedLBszkoSVehGWROdPNZn0K2BUKN2OzEmdaEgwmsiE5H3BnDjSS4bKJgAdRAiX
	8CWL+eeW2zKWF/GDxrsr0mCXtPbBGcDKzOWAQm+LARz7eQrOPbbzORd2Alx5QHbwtGZ+P/CF8Ko
	ye/i6JlfRoWfkXJ8cqyaQqcOv696so/VXKfPW+yGlB5IHTTlid1WNqxVx6AhyDMmqNIkaz4XjMa
	8EZVKgkM=
X-Google-Smtp-Source: AGHT+IFTFEHCvLaGHp3dLmSDqBIEvCaNTT+cXX7kVGMx3xEmdqHdogSDXb/eN7l4LEq4MVLdCLQc8w==
X-Received: by 2002:a05:6000:18af:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39d0de62689mr11800118f8f.39.1744049207297;
        Mon, 07 Apr 2025 11:06:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b72d5sm12601873f8f.47.2025.04.07.11.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:06:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:06:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Abraham Samuel Adekunle
 <abrahamadekunle50@gmail.com>, julia.lawall@inria.fr,
 outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <20250407190645.285fa924@pumpkin>
In-Reply-To: <Z_PE8usXhpLJ4sTd@smile.fi.intel.com>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
	<2025040757-clergyman-finalist-0c63@gregkh>
	<2025040752-unrefined-labored-8c8c@gregkh>
	<20250407132115.11ded3d9@pumpkin>
	<Z_PE8usXhpLJ4sTd@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 15:28:34 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 01:21:15PM +0100, David Laight wrote:
> > On Mon, 7 Apr 2025 08:53:30 +0200
> > Greg KH <gregkh@linuxfoundation.org> wrote:  
> > > On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:  
> > > > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:    
> 
> <snip>
> 
> > > > > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > > > > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;    
> > > > 
> > > > I do not see a modulo operation here, only another & operation.
> > > >     
> > > > >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> > > > >  
> > > > >  				SetSeqNum(hdr, pattrib->seqnum);
> > > > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> > > > >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> > > > >  						pattrib->ampdu_en = false;/* AGG BK */
> > > > >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > > > > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;    
> > > > 
> > > > This also looks odd, nothing is being "AND" here, it's an address value
> > > > being set (and an odd one at that, but that's another issue...)    
> > > 
> > > Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> > > the lack of spaces here threw me.  
> > 
> > It is still wrong '& 0xfff' => '% 4096u'.  
> 
> Why?

Do some math :-)

> > But it is all rather pointless especially if you can't test it.  
> 
> > Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I suspect
> > there is an array lurking somewhere) and change them to use the same constant.
> > But you need to be able to test the changes - or at least discover that
> > they make absolutely no difference to the generated object code.  
> 
> The problem with &, it's not non-power-of-2 tolerable solution. Also using
> hexadecimal there is not so helpful as when we are talking about sequences
> (or indices in the circular buffer), the decimal makes more sense.
> 

Except that you either want your circular buffer size to be a power of 2
or reduce with a conditional (eg: if (++x == SIZE) x = 0;) not a divide.

	David


