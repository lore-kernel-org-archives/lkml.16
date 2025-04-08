Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E7A1A8407
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126394; cv=none; b=BEcYojI+qlJ37REGM9AP1BmjObruP4V2oLP6At21ekelJfDa00D62klzIxJeySM471L7x3eGF5TJYGiYN33fRwmgQJBg6dvRWQCE1H5ljfaZQaC51TisFB3RZWp0YTXiHnweHGzd1scS3mwoblV9Tct5BFUF6TPMrS5qY44BBqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126394; c=relaxed/simple;
	bh=fZSe9cOE6+lN1PYsZGWt0c0EBhhVZMgfo7/QsrayYj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=pKzr/UaeaByQYvER/8+DEzfTZGA697hI9dObKBuBgZ4lqFZgNYNbVXbYTjB4pksotzqlmvGKzxSMfBzcgcOepBMwWKB99eW+hB6mckcyiCqt0Q1d2gmA0z5gZjxy7VBbzO1GTBfcqHzFb2ObcuPzmHmfeesg8G1u/HeRrDOHAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=XoRvZiXm; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="XoRvZiXm"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso55154585ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126392; x=1744731192;
        h=content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIp5HkuCecJrXO42LNENOtR2HpJcHzON18/VgrUWA2U=;
        b=Ow+jnFZqm6jmGmCKwtp68fvS8/xhVobonijn7snZxXO/z3Xn+l6rKcI8DtnrV4jGOF
         dc/dZ3UhJ0QlicU8tizV5IyRwd8CCxOixuVfg0NUZOhbSofn0NOLjDS22QKf/rnh5mhf
         uYVEd2+CP81Yh/WxhSMT3KAjCBhBl/kqZTazu4s2P4KYtniOC340YkEZ5qExLzr0S4fW
         +DjXxBuCaiZbiTAG8j+lhH1+6dVE9/5CrPFdTCjWRdnaiZ8B13wvQN/Fg8cNwaNqzJAc
         pgvTfV3UIjThiiiV7vJFqt3MyskIoeoO5OtC0lV3zVUqmGeQ8Q6/kZ7Bmznz689vxY4v
         UNKw==
X-Forwarded-Encrypted: i=1; AJvYcCWlOsjszp1tQybUav3eim+SwZS5t5On+GZB3ke39SsC+pXgpnoCZudMswfwkM9K+7K/avYBoDOUDodkkhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4hZEpvX//pg39URwYTNIq8ol5qIPGoDXcOai2ZmiGv0drCCi
	ZklTtk4W+FNZs0Ts20eoI2Dyr2Tl94E1Ih9ZYBThk9nHbVPq6Qqt2wACrdABUvMCR73HEPFGF/R
	gcf5K0qkJzhbZnVImvBjFD6kn9IQLCw==
X-Gm-Gg: ASbGncsQ0VY/RwIL6/dtERO1CYhZKCTE6gAtQ1jCLfrxo0+tc7mlYZLnBB9VkdmeoLc
	KJMy3LpF3I4xKvgI0mNNCgUOoMrBC1pf56u593D6GAMHPsQxLseQs4qkCWszE78rR2QthYUvF8I
	pCtgOMIvJ3dYgJyKiHetzu2qiv9GSGzid9YYzEfjiNimXtCxVFVE0rsPBOt6eQQpv/ZmtkhvObW
	TlyNtrZa1N2YtP2+hOsNi5S20qLvbVpE9f2wUe4pkE+ys2x7ym9QikLWGf+02+zGax13Fiu2jyX
	FfCORRQQlki+ayUQAH3jNC7eMTk=
X-Google-Smtp-Source: AGHT+IG0bJHf8yVxArmgqdUB1VjG2+cLxcbev3xbFIUcyxf0dWKFoKc1j1VYHlHpJORlLSCMN8zrwdAyYHgg
X-Received: by 2002:a05:6e02:2484:b0:3d5:8923:faa5 with SMTP id e9e14a558f8ab-3d6ec536c51mr139672185ab.10.1744126392378;
        Tue, 08 Apr 2025 08:33:12 -0700 (PDT)
Received: from smtp.aristanetworks.com ([74.123.28.25])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d703c0b600sm1161445ab.53.2025.04.08.08.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:33:12 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1744126391;
	bh=ZIp5HkuCecJrXO42LNENOtR2HpJcHzON18/VgrUWA2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoRvZiXmLdRa7ky3oaLJGb1Tqv3cqnbOyHOEdxKTMssua1ZAFg5cxhRrQ8iRbaNOG
	 9/9zQqEjQcKIamZ4YTOx7abJNoRNPtv8sdb+oc46Hlu3PzFvtul41m8DUhDs4OULze
	 shlA2AgFZY1ZmsK07+atJJ5xX/pM8ATUOH41E58xaKu98tjjjRdq3PSbYb45vIEXLL
	 cjbf3rmmQO6NrOcc80HFEPL33TM8RDgMz4+DJm3Op4TL8IxNWO9/gCf8rRPwzTSeKi
	 skiPf5i2kJDf1WDPXZ0LNIt1XeILe/I6Q95BmdJPlWbNUXv4pw4QnIupz97xDoNsC+
	 Nv5jLsfOCR45Q==
Received: from mpazdan-home-zvfkk.localdomain (mpazdan-home-zvfkk.sjc.aristanetworks.com [10.244.168.54])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 81F2A100242;
	Tue,  8 Apr 2025 15:33:11 +0000 (UTC)
Received: by mpazdan-home-zvfkk.localdomain (Postfix, from userid 91835)
	id 79EE640B1B; Tue,  8 Apr 2025 15:33:11 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Marek Pazdan <mpazdan@arista.com>
To: andrew@lunn.ch
Cc: aleksander.lobakin@intel.com,
	almasrymina@google.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	daniel.zahka@gmail.com,
	davem@davemloft.net,
	ecree.xilinx@gmail.com,
	edumazet@google.com,
	gal@nvidia.com,
	horms@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	jianbol@nvidia.com,
	kory.maincent@bootlin.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	mpazdan@arista.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	przemyslaw.kitszel@intel.com,
	willemb@google.com
Subject: Re: [Intel-wired-lan] [PATCH 1/2] ethtool: transceiver reset and presence pin control
Date: Tue,  8 Apr 2025 15:32:30 +0000
Message-ID: <20250408153311.30539-1-mpazdan@arista.com>
In-Reply-To: <8b8dca4d-bdf3-49e4-b081-5f51e26269bb@lunn.ch>
References: <8b8dca4d-bdf3-49e4-b081-5f51e26269bb@lunn.ch>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 7 Apr 2025 22:39:17 +0200 Andrew Lunn wrote:
> How do you tell the kernel to stop managing the SFP? If you hit the
> module with a reset from user space, the kernel is going to get
> confused. And how are you talking to the module? Are you going to
> hijack the i2c device via i2-dev? Again, you need to stop the kernel
> from using the device.

This is something to implement in driver code. For ice driver this reset will
be executed through AQ command (Admin Queue) which is communication channel
between driver and firmware. What I probably need to do is to add additional PHY
state (like USER_MODULE_RESET) and check it when driver wants to execute AQ command.

> Before you go any further, i think you need to zoom out and tell us
> the big picture....

In my use case I need to have ability to reset transceiver module. There are 
several reasons for that. Most common is to reinit module if case of error state.
(this according to CMIS spec). Another use case is that in our switch's cli there
is a command for transceiver reinitialisation which involves transceiver reset.
