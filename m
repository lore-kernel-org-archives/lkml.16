Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490971DB34B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241553; cv=none; b=W2l+es8us5gDYYb2XBaBVFOnWnAy/FYAdMqXR98XU5mbx5XuJWJBcXgolUfJoSGu8uDybUeVAtb+mg/Xh8nBJJpsTVvWyyZqL5xrfJHoeo9SodcZ3NX9UVUqvy76RJQkYzupMVM1eyOKmcr5J4ZRTB0vGUXlyCbjvxkF7u5dmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241553; c=relaxed/simple;
	bh=Ae4tSg4kmOccm2miOn6Vld2T7LyPE4HZAwLWC/VQ3jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMtrnSWxdUtP15pE9EikTprvTx+HC7V3NA16VioByPXsHp9iXKpQfdNqJ0xd1qw0v7wshlZuuF3to4sb5B6xx4VM5B6zE4tJwFzSjzoL2wAPKceP0DmOM/5R2QaSVnVxktD1ZzcJFFxmx/fTiUMejd9SLr+XKTnSEGnr4Stbo3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+6+tyP0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+6+tyP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748241551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nm4c9M80Q1z8j97S6rw42ru1/YFOaWVgzS3+rocsC18=;
	b=A+6+tyP0bSve7J177ap6d8vT6Yq+VIio1AO/s/l58Rbx4TvDSgog1PRb9kjxgJhOtFLFfu
	42L6mGoGKJC5kTtXGMa8IQQ//cmU1ldRq6l8+VXj0eJrpYat8yqxaLMQ6v/G4ZofLiPwm7
	vOZQvTv0v2P8RhoNR5V2ALqUhrACk/s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-MAPfDlzHO92_1QR2PQf6qw-1; Mon, 26 May 2025 02:39:09 -0400
X-MC-Unique: MAPfDlzHO92_1QR2PQf6qw-1
X-Mimecast-MFC-AGG-ID: MAPfDlzHO92_1QR2PQf6qw_1748241548
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so999012f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748241548; x=1748846348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm4c9M80Q1z8j97S6rw42ru1/YFOaWVgzS3+rocsC18=;
        b=sPGw+9g6J22uNUGCnRuPiF9JDWLe5mrGTyDPx5jWoEuhUez3SOl8AcQc8S2p6yvUmg
         zrG2isU8oqIQC+MzobiaA7IUt9OI1rx6xbLsw2XNfUu/juhy/NgoI/+bF+PWrNxjtU7J
         puBSTiUWK8DLLkB1gfaARJNBDFcsmTKeCwKDSmBS/ZcspRfC23mDHCp9Z80qMtmh0zJM
         PQvg6XdK2jgLU4N4U20qLFNDYPBFjx8eXbjXbh+/hu2F3qTU+vW2+tElWDzsQoiJzHby
         1I2PSA8AB/ge8AikhrfcEMl1zSXEQ41lfZcCJ8pJVidaDtakqdqoxEG9NtZ0Vuxa899U
         PIpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOjiyS2dOFTpqkObNj9hK2wN+ZYyjUG1PLkD8fZzq9dGortpc5XDC6W9/A3a0MGITwihXp5YbhkYi6mg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUUG6bPZmPG8kshOHtMAJWzlAJhPeLbTISEjjeO2AMkBH5unz
	rhqswqTmqVR28M3M0BdtIXlfprmj59Q86SA3l131Dlmrx2yO6BgU0ftqUJPZfGPGiqiNQwWfG9L
	fomK8E063bMEQGEa4t+nybIDlg3/2JkJTTj7niHlJrTbZrj7Q1UNoHmXoaQofZYqErQ==
X-Gm-Gg: ASbGncvNmAxhBv8cyqPDhbEoij1vXKYmQ4MoVVRi2b7xN5tk+eLUuaBpVgfvgBIbaqY
	Ce3gFYDeYNyKOJOvJtLEqfLq2gf9nYRLzMhFEVI4LBheIOVAIO/D0zRZINofS33WASx5Yxaw16q
	yx0A0t0vMsF/K/dERHft5rd8JUsEv/mnZWQnSoxhIdwMCZwgLuatUJn02umD10z71ZpeTlrr0Ia
	T4Sq7HaapglROjZ2diQUDTDxWwsTiGv1Z23knVmpxUV2w4xuzcZY1zi/l4uTlOaBGzgcJMC3i8n
	6ULy/oBaiqTFc7Yy8yc=
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr712394f8f.4.1748241547630;
        Sun, 25 May 2025 23:39:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHndZUEepyKYMwEo5a/tkf0IiFhlmHejT7ojvDBOeg+h7FMmR/yDqdIddZzGS2LYqvecgN7Sw==
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr712375f8f.4.1748241547256;
        Sun, 25 May 2025 23:39:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0552esm223589205e9.11.2025.05.25.23.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 23:39:06 -0700 (PDT)
Message-ID: <be4c5d3d-f2c9-4a09-96ec-0b25470ef9f7@redhat.com>
Date: Mon, 26 May 2025 08:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] net/mlx5: HWS, make sure the uplink is the
 last destination
To: Tariq Toukan <tariqt@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, Moshe Shemesh <moshe@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Vlad Dogaru <vdogaru@nvidia.com>,
 Yevgeny Kliteynik <kliteyn@nvidia.com>, Gal Pressman <gal@nvidia.com>
References: <1748171710-1375837-1-git-send-email-tariqt@nvidia.com>
 <1748171710-1375837-3-git-send-email-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1748171710-1375837-3-git-send-email-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/25/25 1:15 PM, Tariq Toukan wrote:
> @@ -1429,6 +1426,14 @@ mlx5hws_action_create_dest_array(struct mlx5hws_context *ctx,
>  		}
>  	}
>  
> +	if (last_dest_idx != -1) {
> +		struct mlx5hws_cmd_set_fte_dest tmp;
> +
> +		tmp = dest_list[last_dest_idx];
> +		dest_list[last_dest_idx] = dest_list[num_dest - 1];
> +		dest_list[num_dest - 1] = tmp;

Here you can use swap()

/P

