Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DEF12B94
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878980; cv=none; b=O9b6Alv1JEAmpVGpSbBjrMHL6HNGHAmFH0jHtLh8s5CMeMHVOV2OKm/qUugjdGdUDFz7UxZ5Lkl+Ae8Udr3cbNZAaGoxpW2QalqV2AAmE/8X8VP5Z8vBIOcOTi9RizhA3777UEMDe41PhUy8FeOkI/qqQoBkp1sN6x5GRK6379M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878980; c=relaxed/simple;
	bh=H5AGpXFkOjiqm0mIQhiYkitJE6OcKeVywqSZXg2cGe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8Nrv+ywQAGy9x4MpnmHzKFyj6RVYy8hevyef9BneKkrqcs6zprDTEE68tcbmUPanq7L782JmvVG7u5cdsyupClJcVOzWs1O/Kj+4fOkk/O0fqlJnslsKqohXqCyQfWR1fugx29aeL7S0TRIBBw6F4Nwff39cjRHVW4I//7QiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxnFszlc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxnFszlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747878977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NW1557HPhPEiq5XsZNPrPBkBNdkeXJBTcWKSIzVke6M=;
	b=OxnFszlcDNwtKcd1iRDwmqemrn8BfC0E1DVlPefbulCrmwNEbzzj305TySKhfc8mCRO/92
	iDjoe9arOuL5LyUbGf01zCwMUIdhMaic+XqdHDQC7WlBKKG/NvH8cFo93i02F+c9BkWBdT
	JmdU7fobyTejOMvmZ5JYSdQP3h/ACR8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Ew7tjaoQPDOnqs8kATKreQ-1; Wed, 21 May 2025 21:56:15 -0400
X-MC-Unique: Ew7tjaoQPDOnqs8kATKreQ-1
X-Mimecast-MFC-AGG-ID: Ew7tjaoQPDOnqs8kATKreQ_1747878974
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-310a0668968so1160691a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747878974; x=1748483774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW1557HPhPEiq5XsZNPrPBkBNdkeXJBTcWKSIzVke6M=;
        b=SruS9ayAta2ngYNNY7kVkYJCRsbuq+Qpc6vlPPSSioiFPTaXoUrSDkF773lKFMh/En
         P/LY8ye6vyAvTc7bl/nT7cMuh03zhu8v/km56gW+ZOiaJ55EbKv/Z+NuQvkBnYHGQEmf
         0G3+gi90aW9jZ2LW+b1LOrx2OM3cV3h18gKvZzpWazG6AtkdozmMGt6+DoyZj69KNoxU
         tYnHhZ8SJbGpF6sYSffdcY0MtgzUi2J20+wuA87jIner1GUajyCLqME5FJU296MNcS6d
         1xeGB7kjHYgcpNVAGQmFlE7HeT1/9is7mxR6jfaNVu2wTDIBBGekqng558pHf8acqcrn
         neuw==
X-Gm-Message-State: AOJu0YxxFXy1bNr4Rpz5mF/acN3go6BDzpdj0EEJmLKSz4id8mh6C1cc
	8Ki0yDaAlOZn6yWw2N6z0Ka0udqPlsj+Ryisr+WGaeYWUf7KwlUt1sjO03CybIUTYP0UACTGtSq
	fqi/ptTsPykUMy/ZxQpsRTuzfy5WfoFsHRAuZR7QxchKAx/fQpqmt4xAUZ3rrrFDnpQE2NAvSm1
	sA8KaOXvv7jdmcoD+eDJila9ZDpbeZdz8TcLVUXigD
X-Gm-Gg: ASbGncuXX5BRgNDUiqMwcINNBQknRLdo0b0nk3QQqeEisGwqp5ng69syNGaLWTCvYf6
	n55+DXuhhSuJLY/L8BeYhJxV6EZmQcH8Idm3JJ+F1UlvMH/onA/C+2haOxxauyse7tEtQSw==
X-Received: by 2002:a17:90a:dfc7:b0:310:89e8:c7ba with SMTP id 98e67ed59e1d1-31089e8c7e6mr9243384a91.2.1747878974132;
        Wed, 21 May 2025 18:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9nY1imNdOY1fcMkW5165nto+x/L6mYFFJjGVHS0ov9+6/DqssyAmH+DkYaeCMnk9KynCvxnLw2cMUX/UbDDA=
X-Received: by 2002:a17:90a:dfc7:b0:310:89e8:c7ba with SMTP id
 98e67ed59e1d1-31089e8c7e6mr9243348a91.2.1747878973727; Wed, 21 May 2025
 18:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092236.661410-1-lvivier@redhat.com> <20250521092236.661410-2-lvivier@redhat.com>
In-Reply-To: <20250521092236.661410-2-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 May 2025 09:56:02 +0800
X-Gm-Features: AX0GCFvAN5m910f9nvI8DBz7vO_Z6Tqq5Z-RhLtNuP933xBCKM48QQKj3szEI_4
Message-ID: <CACGkMEvvNcnDvsowuEKOxK9W+un3dYWP+YxtNd4Z1XsUU-ZrUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] virtio_ring: Fix error reporting in virtqueue_resize
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 5:22=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> The virtqueue_resize() function was not correctly propagating error codes
> from its internal resize helper functions, specifically
> virtqueue_resize_packet() and virtqueue_resize_split(). If these helpers
> returned an error, but the subsequent call to virtqueue_enable_after_rese=
t()
> succeeded, the original error from the resize operation would be masked.
> Consequently, virtqueue_resize() could incorrectly report success to its
> caller despite an underlying resize failure.
>
> This change restores the original code behavior:
>
>        if (vdev->config->enable_vq_after_reset(_vq))
>                return -EBUSY;
>
>        return err;
>
> Fix: commit ad48d53b5b3f ("virtio_ring: separate the logic of reset/enabl=
e from virtqueue_resize")
> Cc: xuanzhuo@linux.alibaba.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

