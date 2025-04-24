Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BED18E20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459390; cv=none; b=Dd1Df/ozcISxYnf0ITkk2+RyOcyYWMyx6TlYkpK+zZk60DxSuAjFVH7VChXApeInI7B6K4w17VlHOwFyh4OSoVOOtJyjWl2rYa/An3FfbpC4JJc6RmVnIXugGAOJjZSxeZWOsi2RAL0hgROlyVxJSY51OYckdYPSgOzkxjfFPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459390; c=relaxed/simple;
	bh=IowWVH3K9iwpNQaMTGXZkfw0e/2BgFmZ3Z26C9QIL3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBZrl89NuDxG7SMj6Z62HGwuZaewdvOYNJJ553PNhVo9b981tlVoBrmMq+ZL9plYmf9ftsyNSmguz98DG2eXI0b5N6omvqds0BKmR3Ys44FHgPLg0hcGO/iDU50rxMQ7xLleZ7R1LF9n1zRGFYH9MfcUQ8ffiF6BQkdGgqZBm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=cBB36X3U; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="cBB36X3U"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA7C3419F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745459378;
	bh=73Jw1LNaTTLgW1MT9gMWZl9x5ym9pdlC9TvxDPIE/eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cBB36X3Ubce5M5Nb3TLqQ0ENGdnYwdvmue1C23rMaaoovPnCRb1kinyOMY5qBIOcJ
	 Y6zfCywuoUvCgghJOSjz9SYOtesO1TlRL7JH9LXFMw8WuWcfNenfOODNaqSxTeEzCI
	 S4g3fRmanPYU9by4IjcwstVPoy7tCU9UaBUTCOEuuAiWXUdqUiqtFOwp8OpuIZM/1l
	 oQAcdvmfel9TTnqVRN8Z78x06fT9X4UMIMaLjvK55rWWbZ//qeGcJ57v1HZqmrp+nw
	 AyENZM99t7FBNJ2c6wor7BqeMxOib/SOkTAXkyTR/8Uz8Al+7zJVhG6uLzeLdv+/tc
	 0jjVcqlwhML8g==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so1874235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745459378; x=1746064178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73Jw1LNaTTLgW1MT9gMWZl9x5ym9pdlC9TvxDPIE/eQ=;
        b=eqt/Udb147M0fEv5PiqBP1l3gOGYvhJp8wOotOI9eIwfMzi/Qzxp3wF+Qgt0WMacZg
         Uxv4YG2o9yCqhuYbW1+tr6BabNH2+6fmTaRRI4RVpEKBMk+DJNrH/rgk5eB24eimcCGR
         hpBR5YbMknWrdvXM0uS9dzECM3axvIhRuptvOoOfyPSK+YA7Sam0PDvUW47UBMjxoG4F
         12DyBd4gfq5rZ7QlMB80eiCbtwB/AmU+Nv+9oDfnFXj+TZW5ZIGyxAa8xx9BKhpsQ0cD
         9Ap6Gjk9vAUU45lWQR8VCehljwQ6brY3Xbb4KXVCXDiO3YjKX7gaanElPFGzL5GLAPmq
         qNIg==
X-Forwarded-Encrypted: i=1; AJvYcCVVQiC3K0TJkPdtDnn2B9oV22a7h9DJfudjbfc7URmPRPgDXOYlTVU+Rzs0iuP3QbYvnR1z09+8jMrZp/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSDVp2EXdei/DPkY7QYrVoz9W1Az6UIRYDOu+yAWhUQoZg3PEw
	mklBlk+6Cx7b4l/3+v3iPPL0LEGxWRaHZIpD3HkfA7gCrO5SLXGOwBzEDcaMYnjnVAxC4jCA1vZ
	waIy4XegZBS1eTCqWFEyj9KvWLLev3usgK2Vu76kof5JrFOF3MRHevY3ZYQpbmPMIjGgsf9w/qd
	oPxled4uCmDh02oeSkx6nRuwwUVjIFx+QZxzlNHrbiwdFDUlPpH90n
X-Gm-Gg: ASbGncsTbZ9yb/kaZYadlKNCD1VuOnMblgvHcw9S7k12juEyEtXdUjG94niESwaysUb
	QN+Vu6joDwtI8KZU/ubFiRNAXs2IdDfiv2zV8+4Xgf+kgwY9VF4sIzOtFfC4eJ4j6BlNzvw==
X-Received: by 2002:a05:600c:4e42:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-4409bd906famr4209585e9.29.1745459378408;
        Wed, 23 Apr 2025 18:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3EKQfq6rxDlZcEmm7j8KdrNoJE5TKKrB64pg/6U3nUr3CSHLcJfDNSWAf3SuHHChaArnz4uX27aU7cwSwOOA=
X-Received: by 2002:a05:600c:4e42:b0:43c:fd72:f028 with SMTP id
 5b1f17b1804b1-4409bd906famr4209495e9.29.1745459378022; Wed, 23 Apr 2025
 18:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421130038.34998-1-en-wei.wu@canonical.com>
 <CABBYNZLXd3EzMhf41wJg93jNp7DWQK7oHOnHGv_ThZJ7yMXTGw@mail.gmail.com> <CAMqyJG08e=-7GTmJjvFi_=YTFupabDBAnSGNmhG+SX1F9z=PTA@mail.gmail.com>
In-Reply-To: <CAMqyJG08e=-7GTmJjvFi_=YTFupabDBAnSGNmhG+SX1F9z=PTA@mail.gmail.com>
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Thu, 24 Apr 2025 09:49:27 +0800
X-Gm-Features: ATxdqUFhdo9dw7YGzMzeJhNQ7sjkbm5WN0ZON30Zhv-Xu9WolTcej4DLeYT4VdA
Message-ID: <CAMqyJG3TRRP6PMSzcaUn6=01JGnCjzhGFqtsKy4bxVO5Hr+y1Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] btusb: fix NULL pointer dereference in QCA
 devcoredump handling
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de, quic_tjiang@quicinc.com, 
	chia-lin.kao@canonical.com, anthony.wong@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [PATCH v4 1/3]: Move the device-core-dump logic of QCA from btusb.c to bt=
qca.c
> [PATCH v4 2/3]: Fix the original NULL pointer dereference as in [PATCH v3=
 1/2]
> [PATCH v4 3/3]: Use skb_pull for safer skb access as in [PATCH v3
> 2/2], and use skb_clone to avoid directly resuming skb->data and skb->len
Should be [PATCH v5 */3].

On Thu, 24 Apr 2025 at 09:46, En-Wei WU <en-wei.wu@canonical.com> wrote:
>
> Hi Luiz,
>
> > While at it, please move this logic to qca specific file, there is no
> > reason for this logic to remain inside btusb.c
> I'll work on the v5 soon. Here is what I plan for v5:
>
> [PATCH v4 1/3]: Move the device-core-dump logic of QCA from btusb.c to bt=
qca.c
> [PATCH v4 2/3]: Fix the original NULL pointer dereference as in [PATCH v3=
 1/2]
> [PATCH v4 3/3]: Use skb_pull for safer skb access as in [PATCH v3
> 2/2], and use skb_clone to avoid directly resuming skb->data and
> skb->len
>
> Many thanks,
> En-Wei.
>
> On Tue, 22 Apr 2025 at 03:17, Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi En-Wei,
> >
> > On Mon, Apr 21, 2025 at 9:00=E2=80=AFAM En-Wei Wu <en-wei.wu@canonical.=
com> wrote:
> > >
> > > This patch series fixes a NULL pointer dereference in skb_dequeue()
> > > during QCA devcoredump handling, and adds some safety checks to make =
the
> > > parsing more robust.
> >
> > While at it, please move this logic to qca specific file, there is no
> > reason for this logic to remain inside btusb.c
> >
> > > The first patch fixes the logic bug where dump packets were mistakenl=
y
> > > passed to hci_recv_frame() and freed prematurely. This was caused by
> > > handle_dump_pkt_qca() returning 0 even when the dump was successfully
> > > handled. It also refactors dump packet detection into separate helper=
s
> > > for ACL and event packets.
> > >
> > > The second patch adds bounds checks and replaces direct pointer acces=
s
> > > with skb_pull() and skb_pull_data() to avoid accessing invalid memory
> > > on malformed packets.
> > >
> > > Tested on WCN7851 (0489:e0f3) with devcoredump enabled. Crash no
> > > longer occurs and dumps are processed correctly.
> > >
> > > Changes in v4:
> > > - Fix unused variable error in the first patch
> > > - Refine commit messages
> > >
> > > Changes in v3:
> > > - Use skb_pull_data() for safe packet header access
> > > - Split dump packet detection into separate ACL and event helpers
> > >
> > > Changes in v2:
> > > - Fixed typo in the title
> > > - Re-flowed commit message line to fit 72 characters
> > > - Added blank line before btusb_recv_acl_qca()
> > >
> > > En-Wei Wu (2):
> > >   Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
> > >   Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump
> > >     handling
> > >
> > >  drivers/bluetooth/btusb.c | 120 +++++++++++++++++++++++-------------=
--
> > >  1 file changed, 74 insertions(+), 46 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> >
> >
> > --
> > Luiz Augusto von Dentz
