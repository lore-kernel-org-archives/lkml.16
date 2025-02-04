Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709C204598
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738707663; cv=none; b=UOg1YYeCqYijicapQzvcwgzvbfg+GgO2S2FwpHhgdkTce3nfk7+PeSkUypwLSdOXtJkXNj3RuvXRzKOBPVqGjWkotdihYBHvsrJGewRKwyfjipeWFcqVfy63oYfaWJrp8Y1110L4DQTFF+QvH7jbRoiLOQXkONXNG6ehB7DI5+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738707663; c=relaxed/simple;
	bh=+CeFqKBqhlZhlIk6W2pTaFpwChNZRiTcV3Ygn3b6F2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2Xk0tjQr/k2Cu2NRb/vMcn8Nu8YLwHeUH2libwCeejL290lqVMAIS404nf2GAO+jjGWFm4IYfG+o7UXt/juPUgl3PU/wjNSrqVShZnPZzWJefQ/pUXOJIw3U0a0EIRVuPCHBl9Y6J//KbyXCv7tYEfHp7y6mBahcKBWTIKs6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BXczNqkh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BXczNqkh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso1337565a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738707660; x=1739312460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbZRn949fqsNY8W637R9IOTV62nIPAK7Olzkl6YQ3nc=;
        b=BXczNqkhuwhbDeW/UXOm/YFcbewBwh1CrctTdcJrramDNGhKfXWy/h0onPn1mCOKKd
         iJnmDxS1+p0MZRbQCzCXAh6+REL0AvBhjqzGCEfVNgMAf72kN2WXy+j7+qle1FtxnA/L
         bWdENgsY2r3qq3NyZYpoVsDb8VaGENab+sgDvAIRncAvvp4G5ece6fZGzfzZlV46dWWZ
         tVbe7gASyCv8kfGBY0/CFB31qt9UaiQeZKdjn3pAKEKn+Ujlx6Q5/Ru4EEOoKGLIKggH
         KkyaSFSQv1Ng4M4vVWJNHhbW6/RJKKwP5imaWDm8mxOqar/n2+rHTQyMQPyzigslcQ57
         9TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738707660; x=1739312460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbZRn949fqsNY8W637R9IOTV62nIPAK7Olzkl6YQ3nc=;
        b=KA87La0SfYUrg26rfehoDqbQUv0oeTaXSGPzL6bWmmOoaNZ7ohgLLBocvkgo25dhcn
         YYIAXujPaw4rxfu0s56ZvINwIRFixMsaAaQaA9WcX5OMSfcbvyOptrW+e2Kn6TrPZHiV
         1NxekZY10RkiJu1eVaUVd8S9I6pFpMgKiyYBBQ7419Guebt05apzpSlo6GJgE7l0y7s6
         JjVdeCkewPLCBsc+oHz4XP23XPGx+ChaKvvtmbvE/KRBPfayzumntbC9f3UPEeKX5S3x
         39V4rAF5i2cRHKm8wQg/YpZbzkM+gmFC/0tuKF8QSv6NoOi7y20zR/4bHGchhgsohtQH
         kBRg==
X-Forwarded-Encrypted: i=1; AJvYcCVc9/nQ8rx2gpYYwnrWxeSdNWU4HZCzpv9XvbmchTHwjmPy78p9nb/B6bpdglNjB10BFJb3gMuK1JsZ3fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCpCNHbITqQFmsS74sLN+2B/OsAZTB+yzgbhlHfKJIGWUpZHc
	9eTSIwH8Js/bd8w5A9QbNEHijfP1xiOEdRWOsYuGD0ks6LfOXNLJSOYVWMkkVAiV8LnHd2JxaDe
	FJ/Dv/f/3L1+CqlvV4VVpW+s01wCPmDwaO3pxpg==
X-Gm-Gg: ASbGnctzhfAWgsiLjx2sIg8nvPFIRJSkS1YAlTMgjjAw2Bo786PUyYAYTkg2s9ZZFKc
	faNhtOE2z+Uwcy84DMbdVOLwge2sN1y0ruaVGEEwyenjGWY8T7zt26SXqA0mR+aNvKJfnfss=
X-Google-Smtp-Source: AGHT+IG+hNUNubJqc2VORFiJJg7jqwxIdTac6Uw6w4/SIcexLofVy6de51cnD/zzEReswrk965OaxzRXydmvs5Gy/so=
X-Received: by 2002:a17:90b:2883:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f9e0867b55mr241172a91.8.1738707660267; Tue, 04 Feb 2025
 14:21:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124184311.1642797-1-csander@purestorage.com>
 <9ea74200-7cbc-4a30-9503-864dcec9b45d@suse.de> <CADUfDZoT7JW+d+j6YNmWJ3CKZ45gbvcUSsE6boZwE1C3iXw2_g@mail.gmail.com>
 <f75c62ce-04a7-4bc0-ae77-8ed80842bf37@suse.de> <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
 <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me> <CADUfDZq3ZqpP9hZhgG1gzyyggG6SCQiHqHdgbm95TU2oZ5QFUQ@mail.gmail.com>
 <17d0b30a-758c-4a84-9879-0a070656f15e@suse.de>
In-Reply-To: <17d0b30a-758c-4a84-9879-0a070656f15e@suse.de>
From: Caleb Sander <csander@purestorage.com>
Date: Tue, 4 Feb 2025 14:20:48 -0800
X-Gm-Features: AWEUYZljLajXeyBXnqrK0EM7weu9z3aaeGY93wupCoZbhd-J_3h7jiMfa2mzDM0
Message-ID: <CADUfDZqy4tO5DxWejvBN7-xBVfCfKae4PDq70NYsgMhU+kkJ-A@mail.gmail.com>
Subject: Re: [PATCH v4] nvme-tcp: fix connect failure on receiving partial
 ICResp PDU
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Maurizio Lombardi <mlombard@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 11:20=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
...
> The PSK identification has to contain the host NQN _and_ the target NQN.
> So you need to call gen-tls-key with both in order to generate a PSK
> with an identitify which can be found for a connection attempt.

Got it. With "--hostnqn `cat /etc/nvme/hostnqn`" added to the nvme
gen-tls-key commands, the discovery and connection succeed. I see the
same behavior with and without my patch.

$ nvme connect-all --transport tcp --traddr 127.0.0.1 --trsvcid 4420 --tls
$ nvme list
Node                  Generic               SN                   Model
                                   Namespace  Usage
  Format           FW Rev
--------------------- --------------------- --------------------
---------------------------------------- ----------
-------------------------- ---------------- --------
/dev/nvme1n1          /dev/ng1n1            d95671fe6e0ebf8c199c Linux
                                   0x1        268.44  GB / 268.44  GB
  512   B +  0 B   5.14.0-5

Hannes, is there any other information you need or do you think this
patch can be merged?

Thanks,
Caleb
