Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837781FF61E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061917; cv=none; b=Z2TXTxb8rjpglNFzS4Bm98QDsLMfjbyzIcMU1skKZrWJumuenPtdAInu4HkAVW6eNnNV3xieDAAYkfbWjY7/0EB48ZO3H++9jq79DW3JF31F/pnDc7RHdVRVYrrvJdYQ16BWqN7nL3pe4OitGecNVycf1Ll0N0k3aPlRI1BQfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061917; c=relaxed/simple;
	bh=lj+SRBXnGsvFf1NOFHTmthPnLRUd7U7gHWbfI3QLXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkocXhl4FCAJKbZVy7tG8pdOnqRHQgT9KjT8tkOyPFHRdlOYVFaMFNUdxeXvocu9x7IrtUL6L9K0MPE1fzftu6xOWKNNjqdEO3iGZz0iNaZoKYi8DUCLBZoHQfc9spNFZvxjiWVghLSHD43JH8SO3SdX4iz0pnZ9DtLx3UWmeF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMJ0RddH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMJ0RddH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbd96bef64so100925166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743061913; x=1743666713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
        b=HMJ0RddH+/NpIkJ12mchDhveiC+QwEQgU+h4kStEpod5PM3WKeCZ9tYfs+018fzovD
         kcDNNo6S8h8yT9wbkt5SI5u6N7bEkyG9Qi3alGB1J0cSjZZNdNOCciO3r2db5t1O8zWU
         6wZYCq2rU1GgWyChIvv1ytrCA7rclRgL6FwIV65gk6rHTTMjxwtkrAvI+wxflDAQgxe8
         w0ruP6ddAlghULef73Y2zHlTPyS0GtEf8ItiXzye8FmFEaUYK/Ah7LcY70ZHn5AGaEiq
         8j8R8oAP0qPRNk5rbNAqvEoOKgaZzKrAmghgkAaOVnvOLWHxVWa/raVrRlgVAVb0Hqcs
         Z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061913; x=1743666713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
        b=wNl0pQubsffy8U6o83xS5K5BH26HoEwuOxpGJdExlMG0uVMuYy5FzRH67zu+XNYcHS
         YRNayyNE3rrmCVTkU1Ka5ysuma3mnW/veVSUhs/5kCahU94ky86f3dNphihQvUrPyMo9
         OfbTAuSgnYf8ExVn27bxKdD+FqvqqEPFGBDFH9vVk7uLuBj2Fhuue+qTPa7/MwpdnmYO
         YeCkdlzdtTLiMj1nxixYn3xHh2i2vCVQr29h53g8bQW6CyYg7HyQOTlOyaMyflJNIRR0
         c26krLabMsb3b7V9PmoE+ZMliYVnEi7/JyogsrWvJIPT5rF9RqNP177mBqoKpnmePOZ6
         pPlw==
X-Forwarded-Encrypted: i=1; AJvYcCU9edq6AaoFlDJqa2gVMy/Cuk7YGzRz9Iw8aSIUg0jlqvv/2OygsVlDfZqTMzVRQ1ANp79NUD3FwnTKzA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAA+s1U7TKz/CD327udcLf+QzUXKgLhdhPdhRQA5YGzreNZOF
	N3oslVlN6ubZ3UAb25P006fDIgI2rkwpqv8viGVCDcUD1/gsn0+k8oHCQEI4uEU=
X-Gm-Gg: ASbGncv0deaLPdkkcJprqFmSJIYrMptmLs6bu2N9lG1dOi+9ojG70jMf4lGpuNHfkKp
	VXq0D78/O5Xm93/50EFbyw9qFgQbuwFDcZo91siBTa3Iw0wQf/bZpD9OizDBe2tyYEWxuQxMljk
	ezubnuVF8eSr5e+JUBEYJVsnYq0NmewhQcgCtYow5rJW1titqZHLOjQpkLBUm5kT7BwevB9NgWM
	RdyHgkD3E0cWLug5CMw6qN5zOxztoMXtBjTXC55WcleIdQ9KCuInbqTBQOT6tZrV60NPkxJMK4j
	mhMI4Iay8b5/hiWA/NZ0WuChbhMQ7YZ+cm7cbYX0/g==
X-Google-Smtp-Source: AGHT+IFV1UJVhREk9/GsUuOGS9IHZ/MvkBCpSqwJ+EdM05OmvKh/YSMogqljBF93/hELR+0ofu4aZA==
X-Received: by 2002:a17:907:7b8c:b0:ac2:9683:ad2c with SMTP id a640c23a62f3a-ac6fb1d6bdbmr197580166b.57.1743061912747;
        Thu, 27 Mar 2025 00:51:52 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm1166893266b.39.2025.03.27.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 00:51:51 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:51:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
Message-ID: <Z+UDlXFKbmxCECp9@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>

On 25-03-25 19:21:27, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the devicetree.
> 
> Unfortunately I cannot test this on the non-OLED model since I
> only have access to the model with OLED (which also uses the
> HPD GPIO).
> 
> I believe this could be split into two patches; one adding the
> pinctrl node and one adding the hpd gpio to the T14s devicetree.
> But I will wait for your comments on this ;-).

You should definitely drop these two paragraphs entirely from the commit
message. Maybe add them to the cover letter.
