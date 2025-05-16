Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FE635
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747370819; cv=none; b=nA+mRDj5hypzPewv6wTvHaXOzNztkOOp/KqVPQbqo6bW/W8QEObYHUbJkRnEHXusdkQ+f8N1WuSxHqeGdELhQqfBcW6XIPBewsU/T8ddlf/OK9wasB8AE3RJ2cbvc+QD/55cP9xbBX1PjebUWE0PDgAayXGH5YQT7ZfUbByemhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747370819; c=relaxed/simple;
	bh=YVuTc2bSEf4nvi4SFTWj2WF2nu6sLlHBK3XBb/RYm80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrI6d4Lm3SRTRCksqRh1RHD/x9/mhCxVVR0DQrlb5h/+OWhQQS3iNaakCG/IqVpvsjeZM9Y5BLRPA3rZeyqpwoLbWJbMZ0Kd8o+0XJPeE7lUWwY10rexTYR942Z9qpwEG4FOCS609z1g5MipT/hvq8ApD7jZM1ADz3ae43xf/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JYrQ7mk1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYrQ7mk1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so4373a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747370816; x=1747975616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p0J63BoeaEvteCr8KS2NoqHGRsgMBWEa842OReu8K8=;
        b=JYrQ7mk1ucg2AijvN4hL4ITFM31ibFWr3SRJ027uMMA7uMMJsvWrrLe464PXCzf6aK
         uqHryffKOQR7BgITf9YT0wDpL49c8RLkcn3pHRQ/DfDDkxr0D8XkFCret+Y4+JUTBLWz
         v01Tm18if45qqCJDBYgRE/PZ9eASV6If8NRMAq9YTdUR127ozFoIxGOslxHN/IS+m0hB
         TsWvzc4Wy4nC05UiCRaB6Wv4bVmV1XdyYCegbTwmyBz7+Mrdrhf0xtwmkxtopG/hXqE7
         mDqnI4TsZVT2VYjL58eyOLQg/LRg4YxG48ZoIFqVdLTNFlrnQk3BeFluQo/y50c86Smz
         SaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747370816; x=1747975616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p0J63BoeaEvteCr8KS2NoqHGRsgMBWEa842OReu8K8=;
        b=EjTCLwgJNaInXYtV0bwBMlDJNrtYPnjYcqwjuDUCepRN5uMP++x5ZTo/4k9zikQjqn
         cESPdKpCOCIcvrouBZGZqAxL9ocec6FgM8EXaWWSErVd/7Do0+TZAFBObxw8X0/Is5bn
         iBeBzs/wq4ema/M8F0nsv/Eb+XfVRXxklLTWI8684Oc/vowksHN87oJigVuaIfqxCQa5
         ano9zyutJcDkWAunLXZ3gWEWwr7aWcWuPNgW4eEJuqYudFQHbVrJBbSVrQL16o3lryJE
         IyC+LxBPo6ZGFdMMROFxt6tzDpzWDrNfeMM/7bk4TgIPuS2dVEfdNWDpetCRrZnFVNpZ
         f4gw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0bfitpy3JRloQrxJlvrPmB3EOEvdU0DxyIXftLWnB4qNafnISfL5TYZAz+UO7eKGGio5efFJVoeAC54=@vger.kernel.org
X-Gm-Message-State: AOJu0YySZ/9opgqpm2RfaM1UMaRHU9OFmXeVRD3FF2rfIm1/sBOjBl3Q
	HkCaTFM7xAoCrEyR927WmtXA9IEEka8oyxg9Xad+jeLxAECk1Lh+p7CbP1AlzRBZxZ1iBrRXfjq
	Rjt/D6BDjtY1eMjFHHRBmn1gh0FKhd13NPcJhDaHS
X-Gm-Gg: ASbGncuFjWKXhKHlIzfhK7V8SbYxwqiKlsK7aORHB08/8xnhYrXiUImG9wllUKA+uNS
	T7abXoZX69Z3Q4hJv7rHtug1ORs8CiB1Lc0cYXaiJJl7Gfr4HOUp4Ll//0QXQRecU4Z79a1eXDa
	Tt4mfojBYbvu6kNNIoYdFfP8tb2n6h/YzWozJQCNFYHq8XCE2Y1cnZ8bg=
X-Google-Smtp-Source: AGHT+IFnmoFOBw17NS2NeC02qMp4/ejkZq6GrfrN6F7Vp/sqYPTFxrI/Eg+hDjqnmiO4OTE0pVaJT9sRsUCUWjBbxJ4=
X-Received: by 2002:a50:c049:0:b0:5fd:28:c3f6 with SMTP id 4fb4d7f45d1cf-5ffc9dbe5b8mr187295a12.4.1747370815935;
 Thu, 15 May 2025 21:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-3-guanyulin@google.com>
 <2025042540-implode-yelp-b8e5@gregkh>
In-Reply-To: <2025042540-implode-yelp-b8e5@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 16 May 2025 12:45:00 +0800
X-Gm-Features: AX0GCFtgmPfhoBhTfthJn2kGFoSwJy9bgtoOW1SPfO4jiDRojCDEDAC7W0affGo
Message-ID: <CAOuDEK1SUMBdxq49G6UxB_DubbM78xUe3w4V062AJ1Ok1NfCHg@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:12=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:02PM +0000, Guan-Yu Lin wrote:
> > +int usb_offload_put(struct usb_device *udev)
> > +{
> > +     int ret;
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED ||
> > +                     udev->state =3D=3D USB_STATE_SUSPENDED)
> > +             return -EAGAIN;
>
> What's to prevent the state of the device from changing right after you
> check for this?
>

The caller of usb_offload_put() should hold the device lock, so I
think the state of the usb device will remain the same within
usb_offload_put().

> And why -EAGAIN, you don't mention that in the comment for the function.
>
> Also, to pile on, sorry, the coding style needs to be fixed up here :)
>

I'll separate these 2 states into two error handling checks and
provide appropriate error code respectively. Thanks for your advice.

> > +bool usb_offload_check(struct usb_device *udev)
> > +{
> > +     struct usb_device *child;
> > +     bool active;
> > +     int port1;
> > +
> > +     usb_hub_for_each_child(udev, port1, child) {
>
> No locking is needed for this loop at all?  What happens if a device is
> added or removed while it is looping?
>

Currently the expectation is that all the downstream usb devices
should either go to suspend or be marked as "offload_at_suspend".
Based on this, is there still a chance that usb devices are being
added or removed? My understanding is device addition/removal requires
locks for the upstream usb device, which we've already acquired before
entering usb_offload_check().

> > +             device_lock(&child->dev);
> > +             active =3D usb_offload_check(child);
> > +             device_unlock(&child->dev);
> > +             if (active)
> > +                     return true;
> > +     }
> > +
> > +     return !!udev->offload_usage;
>
> But the state can change right afterwards, so no one can do anything
> with this value, right?  What is is used for?
>
> thanks,
>
> greg k-h

If we could ensure that all the downstream usb devices satisfy the
following conditions, could the state still change?
1. usb devices either are suspended or marked as "offload_at_suspend".
2. "offload_usage" could only be modified when the usb device is
neither suspended nor marked as "offload_at_suspend".
Regarding point 1, I'll update the function description to state the
function should only be called after we ensure the downstream usb
devices are either suspended or marked as "offload_at_suspend".
Regarding point 2, I'll update the usb_offload_get()/usb_offload_put()
so that "offload_usage" changes only when the device is active and not
marked as "offload_at_suspend".

Regards,
Guan-Yu
