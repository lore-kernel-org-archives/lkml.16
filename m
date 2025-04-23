Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8725B663
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745373197; cv=none; b=Ne829SPtEbw/XWdXcjcUWvPG0VqvFNLdeKXaRs405h/R8VJqc65bKekxQdLaPBQRZj5Fu/CEAZQaU0lE8w+XKtSGjFYmgtZdKUxjarQyEMpM7mz7jZwhwMr/H1ojhGWt66vnzGkRPF4/zjSePG0on2fsdc9xRgS17oQyDlBzQiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745373197; c=relaxed/simple;
	bh=YOADREcuXzeFJ/7ogJYsiWtLPdbvIBRLVZcgwkoXONI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNVvgdKhin5vXljvaN1REvJPONDzbpnJ2o/yUruc1mkAG29n9kZyYmknuBV4zc4ZMYGr9AKoaqZVMIs6ZisR8NQR2TsHX/b1X5WuAInecgZsEQHcftGgiiPD4GlMtQ1ryAPKjjYpoUMzsWzMLvxbaaxQDnmTNLBEK/oAuHTsJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=OB9tJ4Xs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="OB9tJ4Xs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5118995b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745373195; x=1745977995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGiT7L93EPMhEGwb6/RngvZihZULdSMhV4XtuXAOh98=;
        b=OB9tJ4XsxdyY/okBWZ+ZgsXXDwRpzO7HaQtbRIYoocmCWVh7+vs2HPWdFWGJLqN5Az
         gXbPkcvzHrc5J2KRgH8IFNYDAzz/N2ABGjKL142XMAWnGwBJISHMO3y0NLJz9LEBqK3O
         QpbGV/id3TOHmTa520zLLQ7YrRtSoyPzpE7Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745373195; x=1745977995;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGiT7L93EPMhEGwb6/RngvZihZULdSMhV4XtuXAOh98=;
        b=NP52PVFIkwkDZz18AGueSsTA030DH1D+L8ihogK7Pj1vHt3uRyyMYvSvl2xYNVM11I
         fXNKRnBl/xpZRcC+sSqgvqDtgJDqDXPALHKSst3s+f53CKl4sUQwAz22eTSquEHiB0tC
         JTUSd/prdbgdw3Px33eLjwxqY+u1f7E6zfnQMpfSGAIre7V1dzMFCslCehmhImcRUYWU
         UCIDiNSK4/L6PtQFbKACK8pJrw7ve3y/NXdAnnt4Wsr1vq+6kcLoDKQNIBdbJgT84tA3
         BPY76HvDe97DfnaPZzRX+Kp+GNQMJpuUNnQ6Xn7qGmDjcsPPQMeUOrCRNv3VyMvGbTNK
         80tw==
X-Forwarded-Encrypted: i=1; AJvYcCWX8sm4q9HJnQpWB4OOmMWhMAM9JCZk0Oc+9qsnlu5uXuBKI3LseuUju4XczDopz+kRajiTRxRkw2nfUms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHcgtfubjMQgkzsJIiR/EAcBNJIo6zGf+LNZDDPP6AeeoDXOOB
	yC+xgggQU7rH7BtQknddqNvNoF3Qmx2XPnh2CUQvU6Mk3P5B4ApCgyPJOqFc/g8=
X-Gm-Gg: ASbGncuDgc+oIDSaoL5MiM6VQUxtRyURAu/liLU3uakGC9vuZTPB01hhmS676Rzko1Y
	LP1nx8y7K1oc/WJGGmDPolSj98Lwb3ocI0wdnr/BGRCCHn3tAuX0SiKQmE79vZoQO+AAY+Jpy3x
	hgyfDFtYciovH6HGWzaxQgjdxuXWlwGxHMRWCMqkF4v7GGHHM8ehWc3+Xn+FUS+zZ+znDJu3dFM
	ngNobbV+EB2q2B5r1eKIkH1y2YPDoQHG1C1SFUIG/1ZZThgJVR1OOgbwcFNQj2A5p0AehzfmZKf
	uuck6PhRpEiymho0xGoD5r4wts0hjEUXyLD0Pl6EdzX18bscGlMtrdOeybofpY3knoDAADwAQJV
	yfIgx1wA=
X-Google-Smtp-Source: AGHT+IHB4kTggl2g+HQj4syvd8yW2jw969FjiGdBYuNYXKvY4w6+RCyzB+/uh6VxNaqouYmzneOtFw==
X-Received: by 2002:a05:6a00:1142:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-73dc15d0c1amr23847999b3a.23.1745373195665;
        Tue, 22 Apr 2025 18:53:15 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0200sm9332236b3a.1.2025.04.22.18.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:53:15 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:53:12 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 6/6] gve: Advertise support for rx hardware
 timestamping
Message-ID: <aAhICMrep5YHu2hO@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-7-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-7-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:54PM +0000, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> This patch expands our get_ts_info ethtool handler with the new
> gve_get_ts_info which advertises support for rx hardware timestamping.
> 
> With this patch, the driver now fully supports rx hardware timestamping.
> 
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>

Reviewed-by: Joe Damato <jdamato@fastly.com>
