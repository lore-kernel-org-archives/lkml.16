Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C93231CB0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619069; cv=none; b=gswnrtuFxh8Z8UcsCUWt3dAzVB5wK7DemPEu+J5xxuOBLu89dZeH45J/eZZvMVfvnOjl9YeaAa1MOO0VAc+aA44znLb7mgSUiddmcJUkeyHgkZgTK9QU25OnJw/NV9dB6z24vHPIrBJMrZ+g3rxmM+5dfKpddpur514B66gihQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619069; c=relaxed/simple;
	bh=ckiUV8HeIYQ/rsOxCbMNm/VjxU8EUESI63njQcctYnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxBsU9YklLo49k3UL6V1olAwKYlokuo0ZgJ4xstBjhzWOV3xES5o4MFbqvgQkR+IRBMfC60xBUsoZk23p+OFoIR+Tb9WpUbr0WFhgK8qGHcx43LDYJWQxw8m+m56khMQ6w72m9N51Lns4kx5m24zHAXtCzsAz9n/Iz7X9fps3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39129fc51f8so2182716f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619066; x=1746223866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckiUV8HeIYQ/rsOxCbMNm/VjxU8EUESI63njQcctYnQ=;
        b=T0uQOr8OblIZGkMEHtciBsN7kJlc4HanWY6qvsSINLXfxwGV+aDPuZORmRzgaamGHT
         OVXnHjaw4l5tJC9aBjLceLwOGOOkV0+PhH/XIcVi1mPhLGeOJmZKWDAII84+0CvHed1c
         hfrU7vXWpzbnfX5pmrgUzORR4uu/HXy6Kt1Vi5/QarA/df+rJt39ONzrWGA0eEzPCGa3
         NxZ4THzRsQ/OtrfWjWWOu/fjJLHBYAMRQK7Mb9rIDioXgzrSDBaxeJQW7ArjIASVn6E5
         Dxw9/ghepI3pOV1+eMTie99c3vsHpOGViW26OG8MIvWvreqg3AfvkWF2daULD6yPaS5/
         8W4A==
X-Gm-Message-State: AOJu0Yy5he3a/kzUvCGXNX4hxtIw8SRynArNZby4VxuQlgqItLAQEq1v
	HsO61HtGjlRWNMSUnVBvaTLFtmAxdytzRJ/znYw+3kjLX7Kz0W4p
X-Gm-Gg: ASbGncvPOgoW3NUWVP+Qf1BXvJe8fiSQccx5vPELvdIRaNs5k99f/OZ3Zn52iZw2siK
	hfhw5WrNCWhFcTWM03ouNkNthdpBNdS7zePl5Hveaso6if6mcDyb1KCtgIpKSFCM50VOhnl4oda
	wmcL78lwuQDQH0/3Rc3XLus9v1fVS6AGYsjmill6J1zCrQRCTw1XcsIi6MmzsfSDNvQMxeLWN6l
	QfLJfiniR2ao3aO/6v2qrzeQzn7pXIfM16QPk2TGPVwZQjMpA1YSseIi2WlT4GZoJMRrHipry7v
	7sET2HHtlPBrSky17NNl0ZjCiftAm4YoA9MwuGcn
X-Google-Smtp-Source: AGHT+IHvEzb7jM8S26s9kOozO9T3DLATaeR0NrOarikeDIv9/fseE1Rr6rxwWwcH/hVl2u6VyYnrLA==
X-Received: by 2002:a05:6000:188f:b0:39e:f89b:85d6 with SMTP id ffacd0b85a97d-3a074f798c1mr2865149f8f.51.1745619065910;
        Fri, 25 Apr 2025 15:11:05 -0700 (PDT)
Received: from [10.100.102.74] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c68esm3446234f8f.82.2025.04.25.15.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 15:11:05 -0700 (PDT)
Message-ID: <8488e7ae-f30b-4b11-93dc-1973e0dbe732@grimberg.me>
Date: Sat, 26 Apr 2025 01:11:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet-tcp: don't restore null sk_state_change
To: Alistair Francis <alistair23@gmail.com>, hch@lst.de, kch@nvidia.com,
 linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, csander@purestorage.com,
 shinichiro.kawasaki@wdc.com, hare@suse.de,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250423060621.632581-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250423060621.632581-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Looks good,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
