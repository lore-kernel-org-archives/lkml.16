Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A678F6F
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570796; cv=none; b=fh+c3PMvCP9DcgJQuXA7uJ6rweWL0yUraAhBtYADRY1Rqml1qlXMisPiGSXQ+ixkoGzzFwqtQnymyb0maEQxg8Rwp0P7MFuRrGgtmycIGgvJ5hTIvdVC1QFfm5xWTt0Tk9OvxWRMhBtvZyCzy9izzI+yE+1KBm7aglLTM3aUbm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570796; c=relaxed/simple;
	bh=yVckhJMZRqp7JJ3nm6E35JWPXpgATthQ27OBHG+A9Dk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D5f+F717UDrRqndxsFL9Pt9FxGg3kOlKhOn1oAL+7WXXSirtIhhi6Zs1AIwdn3T4S5RBwI7IYb6hSFRFGyWeG5xISYDkOu9vP/0Ya2mowpXaSHp6yck6kN9vFi5sIJgHHH3ZnKtwoM7fDyinTG9sfOulgXr4hvg2Pmjt0H70nUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUQkpsuj; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUQkpsuj"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e290e4716fso11901137.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747570794; x=1748175594; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM/QC1gVKr77CbqRmXNHBYdeyg/fjnQM6tE6eptuJXE=;
        b=GUQkpsujYWUAl4EMtUHC68FJmYdkSmLOfKnPLQEkbDtUQw/5jlqJpnbTveikwjh+M6
         kSQj38ksw/o9bJojJATz4Zz/4G9uSiWRdyd0ufYj5J6uINXfDm8evfbXVNNrSUTKT2wu
         L+3vZq0UmxmH4gDCluogAcXos02jPP42jVRtv89TUNNvQvtZgYBLQvEPuaRJFnQxEOEB
         fnS01myA2zXmjhzXxFf+Td4g0iffzI6Zl0oV5U9VibXfo7/absM20eLDy08U08ozx2Yn
         1xPtyYSFAl4RxmQHyndvQV6Bjapb/yn+gPFzZ488gGkl+baZ6Sbinwp+qnkG/fLcCkU3
         a6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747570794; x=1748175594;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GM/QC1gVKr77CbqRmXNHBYdeyg/fjnQM6tE6eptuJXE=;
        b=Txz6G9dFNXadPLvJB/PMkH5RjPET/PV0dVqxs2MbA/dtzUJhpFT5KbbAQVYacgY4pw
         lP8wjqJ4awCFBomkGjKhpUPCCbE0hfmhVA+Y0S/3xnNgIze2WoCDi24VfCPl3Bu72pie
         i83hPxUx9Y6U1dRnHLVZmlOJgfa0k6WfuuaK2rrUIj7Z95jTEacC1fH6wCO01x4QadNe
         wW1nk+xuBpn2KLQzZKcp02zmMUXxH9O5j3nW2F1c6N5k1GCVFxBzEd24+gM8OEbWsN8Y
         0tQO7WXZT41omdkxnSC5TEE4Jf7pdOBEfiNDA2aBSNHnlHXgG0HI+1EG9T3iEPiMuftZ
         tRGA==
X-Forwarded-Encrypted: i=1; AJvYcCXPzwFeY0zuDk+wIK7tfcBlkSMTZPfCR3lid+11UM6JXw9O9wXe6Q4sh5eyhBBwzraIaQp/KWpyULYTeuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBP0YbshOPhQggjY07zSmk9hVfqlIwpiVjzmtgP8NgRLLA+V5
	JjEL+ZoXmdBPQ3IXvckyWjcnenb1gqg+NC8mX1LEDhnOkv4022UlSY7w
X-Gm-Gg: ASbGncvCjFuO4Vecl9Ihp1QJtCKBApenPmQw3QVnvgDe2zwKX0G0uFlQsQ4FOKTwmiz
	msxZxJVBtTYIpdioW5ijdA3+zV7TkQPDJMFZSvP2s/pGt8HiJPt7V7+8aZZ+XejNWnwPf2zyve0
	CIdFwhex7+4/ue/8oOTBlkzo4cYzFyZzoAERcBg98gE0R8n4CGB03jh4SBSIKcFMuwAqHR4vSGE
	hi3BsZTmpzRsNQFB2/+qXX5ZPP7mxwd8s3Wor23Yq5bNm25ndDB7g2xyWmoMd36WHQ/XLBjuz+V
	CnaTkRgQz89lq7QtQxQF2rdpDfmwIuoRgmT8Om80MtucQDVdUeEUXgxcwpZeO0v4proDMEIyRB9
	6l/qUodTJyXZRf+lbCYk9eM4GM9+LSdneJtwMxIPRXAXVHE4hob2kCxjxPG+FVMWR9FuXfaNmMg
	InSwHW
X-Google-Smtp-Source: AGHT+IGN2Teped95DLPk1BXVHX4qEQdF7jkhVhxNmGtz95Hb+3V9gPxHqCxwv5r9EDPggtBzYXDhaA==
X-Received: by 2002:a05:6102:1516:b0:4df:93e0:fb3 with SMTP id ada2fe7eead31-4dfa6c085b3mr9050820137.20.1747570793651;
        Sun, 18 May 2025 05:19:53 -0700 (PDT)
Received: from smtpclient.apple (2603-9000-d600-0325-d07d-cafc-1c50-99b9.inf6.spectrum.com. [2603:9000:d600:325:d07d:cafc:1c50:99b9])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e0b085a85fsm4436461137.28.2025.05.18.05.19.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 May 2025 05:19:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
From: Jonathan Velez <jonvelez12345@gmail.com>
In-Reply-To: <2025051805-astound-unaligned-db5c@gregkh>
Date: Sun, 18 May 2025 08:19:52 -0400
Cc: Thinh.Nguyen@synopsys.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BD16FCE-26B7-465B-8916-49D1F1EF7B21@gmail.com>
References: <20250518113330.8976-1-jonvelez12345@gmail.com>
 <2025051820-unspoiled-rift-31f8@gregkh>
 <C49E4FFB-81F5-40DF-8DD6-5BB4A3B782B7@gmail.com>
 <2025051805-astound-unaligned-db5c@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.10)



> On May 18, 2025, at 8:11 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Sun, May 18, 2025 at 08:08:46AM -0400, Jonathan Velez wrote:
>>=20
>>=20
>>> On May 18, 2025, at 7:58 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>>>=20
>>> On Sun, May 18, 2025 at 11:33:30AM +0000, Jonathan Velez wrote:
>>>> core: Add documentation of "sg" field in the dwc3_request struct.
>>>>=20
>>>> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
>>>> ---
>>>> drivers/usb/dwc3/core.h | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>=20
>>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>>> index f11570c8ffd0..bb140dde07d6 100644
>>>> --- a/drivers/usb/dwc3/core.h
>>>> +++ b/drivers/usb/dwc3/core.h
>>>> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>>>> * @request: struct usb_request to be transferred
>>>> * @list: a list_head used for request queueing
>>>> * @dep: struct dwc3_ep owning this request
>>>> + * @sg: pointer to the scatter-gather list for transfers
>>>> * @start_sg: pointer to the sg which should be queued next
>>>> * @num_pending_sgs: counter to pending sgs
>>>> * @remaining: amount of data remaining
>>>=20
>>> What commit id does this fix?
>>   I pulled the mainline and worked on the =E2=80=9Cfor-next=E2=80=9D =
branch. Is that the correct process? Should I be using the =E2=80=9Cmaster=
=E2=80=9D branch instead?
>>>=20
>>> And are you sure you made this against the right tree?  I do not see
>>> "sg" as a member of this stucture at all anymore.
>>   This was the last commit on the =E2=80=9Cfor-next=E2=80=9D branch:
>>=20
>>   commit ffd294d346d185b70e28b1a28abe367bbfe53c04=20
>=20
> That is the 6.13 release from way back on January 19.  I think a few
> other things have happened since then :)
   :)
>=20
> Please work against either the development branch of the subsystem you
> are submitting changes for, OR against the linux-next tree which =
merges
> all subsystems together, so that you do not accidentally use an old
> tree.
   Moving forward I=E2=80=99ll make sure to work against a subsystem =
development branch or the linux-next tree, thank you for the help Greg!
> thanks,
>=20
> greg k-h

