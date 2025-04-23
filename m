Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35C21C170
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372539; cv=none; b=BCNt5ORRg+OR/c8sKEjhzNLAWU768QtNzc4Nminq6rULPF33h5vjVpR5dkzqptbMPbIgvRiAtJTsdvo/glUINdzLwxUHq+XxUqMP1MHchr6QJbBtEqg3rS3Q5s4c95PNPDdSqJcgYudrFhAINc80hc+aJd/xT+OYD32nhIg/s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372539; c=relaxed/simple;
	bh=IZYZmcZ5+FeVp8pN0V49Fk54qeqMM7Icf1Fiyxs5RpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmBIVb67BD+MBNTYVf9FEOwYfQSvfvsUByvDupgfjENUg5vgqDIt7vMYg7vL42pAAFiBt8yF/sqKhU5+gQb/1v8NSMjRKl6Y9wVsfwkKLmnY79RKGMmsl50tpvcSjGL6c/6/MGaz6MlZfl0AG2xwpcYyddEoFFygqzcEK/0QaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=USIm+nKM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="USIm+nKM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fd89d036so72397755ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745372537; x=1745977337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0eQlRTWi1ThOTM0osK5ZbTwgG+k9NeRDzksiJyuhXA=;
        b=USIm+nKMT3XDjzXGiP/CcMiuqfeZfG+8+zx5MCxP0TrgFxWmVdmtl1LojF8sLuZee7
         w2PP06dgIFGEfm+G9qOYROq5kJSIlUlmqBsJdCVHn6ctIe4+2IzC1KHMc0i8z8ysmulg
         6YRWYTeMT4MiJVuOibF7a3yK5ksIOBOn6iyEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745372537; x=1745977337;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0eQlRTWi1ThOTM0osK5ZbTwgG+k9NeRDzksiJyuhXA=;
        b=L5U5tyUg07iYo115Ur706PH7gdjFAvUewflTWRy2WgW2dskMJWzezOZv1QF99LT08c
         hyz1MqW1NTxaJrqcNzeF/S+UhDdSt5VSGejxTxg1usr+WcGlTyzW27AenMEuJvNuAOHr
         y0Vhk8DozTstCSreh6sNdbbIYBYgBU19SkP+GeCgpTNsyNlj6pI6MyYtEHXDuuBT8e/+
         z4rfOi4RAeIVQjkxOSwbDU2fAbFN6nApy8C3O3fYzD55csos3FR3LqnQ+Q+XKh23MaWG
         VyEnBUvky1Kb5830e4fN8RxC08OixBNG5qzisWIeke9Zv0DNChZ8ZmhSKyOVqGMe+oEm
         PZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjruGeioa95SoxN5n0hs7H+Y3YYpYVkgTfP2YqQrMn5OAJQNL1ciyUu2CSLSYOxlEzoiu1+yeq8xa4Ly8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kzo/k0+k4rvH8t8IQl2yVcpKo6XdMmClc767qPJ7uiHDN6sg
	uxGzHxJ8T5cV0O90ooWBnUg2Y0lSquKrmIba9Rw2WXVdbCoLdl8DrlkqIAnsvaM=
X-Gm-Gg: ASbGncvheUPKTDvwm0J0Q84KrQN+3zdqdj5w5X67z+efQ760cx+rbaNAIpGFkVCzckw
	hERihV3aspm52f9IGQeFd1fe2A43ELYZQN7tj2nLylcsLDgxInRZRzYJxKOZkt0NU+nPpSF3FV0
	D0CrbDiS+x5LH1ECKf/B4hD6WBsNSIWjqhBcSH9Nf/RKyF+pOuBGasP3WvWrBEZH0Uta9LPLfL5
	yaAHh8p5SeRrY2MEXMhiUWVCIfL7RHnNUmd2+53fmORiMeKhqAn9Vfw4LBJQNhrqVFkpqDEwYyV
	m52i+sS8MNEvbyWv638MDVzrqnqobDKwgzLkNWs0svous9lFZw7CWDpB4bBxKBQY13YVDLhOHzb
	9QOnF4Ds=
X-Google-Smtp-Source: AGHT+IFynIH9OJbR+0cqJfFpfno20jGYpNgsvhoPhcd6N5lULrePTo0fNEqFbkMiFdeOMauJKWs5rA==
X-Received: by 2002:a17:902:f652:b0:223:628c:199 with SMTP id d9443c01a7336-22c53620c8bmr229665635ad.52.1745372537249;
        Tue, 22 Apr 2025 18:42:17 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdea5csm92365125ad.247.2025.04.22.18.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:42:16 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:42:13 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	Jeff Rogers <jefrogers@google.com>
Subject: Re: [PATCH net-next 1/6] gve: Add device option for nic clock
 synchronization
Message-ID: <aAhFdQgbTfP2ZuIC@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	Jeff Rogers <jefrogers@google.com>
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-2-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-2-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:49PM +0000, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> This patch adds the device option and negotiation with the device for
> clock synchronization with the nic. This option is necessary before the
> driver will advertise support for hardware timestamping or other related
> features.
> 
> Co-developed-by: Jeff Rogers <jefrogers@google.com>
> Signed-off-by: Jeff Rogers <jefrogers@google.com>
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
> ---

[...]

> diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
> index 3e8fc33cc11f..ae20d2f7e6e1 100644
> --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
> @@ -46,6 +46,7 @@ void gve_parse_device_option(struct gve_priv *priv,
>  			     struct gve_device_option_buffer_sizes **dev_op_buffer_sizes,
>  			     struct gve_device_option_flow_steering **dev_op_flow_steering,
>  			     struct gve_device_option_rss_config **dev_op_rss_config,
> +			     struct gve_device_option_nic_timestamp **dev_op_nic_timestamp,
>  			     struct gve_device_option_modify_ring **dev_op_modify_ring)
>  {
>  	u32 req_feat_mask = be32_to_cpu(option->required_features_mask);
> @@ -225,6 +226,23 @@ void gve_parse_device_option(struct gve_priv *priv,
>  				 "RSS config");
>  		*dev_op_rss_config = (void *)(option + 1);
>  		break;
> +	case GVE_DEV_OPT_ID_NIC_TIMESTAMP:
> +		if (option_length < sizeof(**dev_op_nic_timestamp) ||
> +		    req_feat_mask != GVE_DEV_OPT_REQ_FEAT_MASK_NIC_TIMESTAMP) {
> +			dev_warn(&priv->pdev->dev, GVE_DEVICE_OPTION_ERROR_FMT,
> +				 "Nic Timestamp",
> +				 (int)sizeof(**dev_op_nic_timestamp),
> +				 GVE_DEV_OPT_REQ_FEAT_MASK_NIC_TIMESTAMP,
> +				 option_length, req_feat_mask);
> +			break;
> +		}
> +
> +		if (option_length > sizeof(**dev_op_nic_timestamp))
> +			dev_warn(&priv->pdev->dev,
> +				 GVE_DEVICE_OPTION_TOO_BIG_FMT,
> +				 "Nic Timestamp");
> +		*dev_op_nic_timestamp = (void *)(option + 1);
> +		break;

Overall: The above pattern is repeated quite a bit. Maybe it's time
to refactor gve_parse_device_option to eliminate all the duplicated
logic via some helpers or macros or something?

Notwithstanding the above:

Reviewed-by: Joe Damato <jdamato@fastly.com>
