Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCDA283FF7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297327; cv=none; b=YIf+NF9O0pGRsRcqKWpKbwfNntnwpjJZNblst3FnpEV+P05XBcK4zmKM78m5R3sizYIhtVKUN5MUK2Yqw5S07GfVquSZDsxTyhHsOZGmQRVTmwXrwlavEwzgblA1g3W45Q+6Qu886Cuh3j6aMFO7OUljLNN0rRGiHg37Qlioh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297327; c=relaxed/simple;
	bh=U6vP9JizHtN697yNxPJICqSQeiHA7c5NancUYDVDTkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXlEpkE4dvC81Qi3o0/A78B2zfR+ipafnbpnVf6zpFDhHNXLRIMEJ/slFgNDjvYqBnTetGsLc5guHVmYjB9Te/8mYiynppWBFJRhSUPVAhmG1vFTIsIaB5TpML97blIfpQYq1Njhr+2MMgQ/jPYPH7TChjrO4hWWzqte/bH9Ew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXYIkhSd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXYIkhSd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a108684f90so367458f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297322; x=1747902122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwqUHHdTF91D3Vj/+GcN5929CF7RhLAulz2cfebEFLc=;
        b=PXYIkhSdYCdDpKxFXhbujo5m/7AoT8u+bfv/tpWalRCcUgC4znsKDTsRukgFvzwqQ1
         T01yMT8Olt/oyWZdycbz7KoPv3cZpZKMRWaVWjnVvDcT41or/BOL46sUpon0xR5V3Lh7
         RfHI+bsuO7iT8c53L0jwO5nk5suaENDzTwHI1PdMXiTxi9MNzPJo/fz0/AmlTNlvi8Wk
         n1/6rPmAqw7c+5rMXREPiUp1Lm+AOqz1pjpFyuVl9+FqGOCAmEcc/aS2Etc58q/pzmj9
         ZZaVQjNiwV33lS+HYIskxc2ZZGR5Xd9XD/Xim2FiPVmWo74K48gkFuCBXycmnIqQCzEY
         aOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297322; x=1747902122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwqUHHdTF91D3Vj/+GcN5929CF7RhLAulz2cfebEFLc=;
        b=CqnexPMbPEdwbTeKHlwjvRjijoD0dagz/vazlrUBy1hUae+MXyUSg5JELcI6UODRk3
         PhDr0jlt4ZHaf4+Df/R380B5AZB6tWzCVMuhHGvgVMwY+xQh3lYxF40pz9Bgp8UIcTpN
         yoeko6LxPTqdwq0FPc+HM5YpwJyyn1jFi0iFuOeCubyA2rDo4foEUxhhoubmI4NyYMKW
         +ePqx4YKfKRNfgKjfctc/FFRRAwSl7r8J26fR8powKUexpPzUS4H9SeYx6buFmCsGBSF
         Rg7BwMAtMimRkuNjqEhsbLNrw+Jfuuuh3gRwWP6DS/ua/mx61wSTDngraavFgn8ExC57
         4npA==
X-Forwarded-Encrypted: i=1; AJvYcCVt1COyqUhGLKKGCj/UTXjLKSepPy38rT8EfyyQBPtVkrQvqu9edXUFCDKINpudn8JjTcEYWqkk24jDoxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5hJaFyC7kodNCuhJ7Bk6CGNdjSdsFt9CrXdaAMaqHviRgf72
	Z4DYh8QHBL/WzvQkfRjL5Y8A6/HWV3S/27xT1eD7xTjaLMZ1LpwygzDqCGu7SFvCXjRIAq3v3pt
	5ITKrOQ==
X-Gm-Gg: ASbGncu7OUZPahpUBOwGRRDJk+YMNSOPYA0lh85rkC9QJTEALihaC6fjEilHlCDPSv9
	rOUWJzk1+0pDWD9rP+Tv+O6vjNWKpDoRQClK6eeLVFZ1vZcI5DzkrEBalqEWPMT5i4s7/B0u71N
	iKQcGjJ0L7MJFiBfoG0HoKeG4CsKqQPxOke3QmYYA5HLx8+iklwODwcb9kLV7ylpTaM5Afm4Wyh
	YrlR8diwW2vhXZN6uMQtErMTXHfctrrxA9HtsayJ8rCyWUeZrMgey00hdVHOpJvpqW4zUCCYhFm
	xXRR/f7QvoJLXdBFsaMCjeVgv4SgzBz/j2+r1JYr5emhEUWLgxLwRJ3vJWBxRcSy8/cDEdIYQvH
	GDqi4oj9ZksRahw2M8fz8/ybM
X-Google-Smtp-Source: AGHT+IEvJfsPG0RbSxlh3qVywIhfEe0j7tWzjzYk0eTDxtJ6hIF/F55PmVsRP1w3DwDXesYgeUcG7w==
X-Received: by 2002:a5d:5f8a:0:b0:3a0:9dc2:5e0e with SMTP id ffacd0b85a97d-3a3496957efmr5669361f8f.11.1747297322537;
        Thu, 15 May 2025 01:22:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddff6sm22256614f8f.12.2025.05.15.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:22:02 -0700 (PDT)
Date: Thu, 15 May 2025 10:22:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Noam Camus <noamca@mellanox.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert ezchip,nps400-timer to DT
 schema
Message-ID: <aCWkKJladcEtGMwQ@mai.linaro.org>
References: <20250506022237.2587355-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022237.2587355-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:35PM -0500, Rob Herring wrote:
> Convert the EZChip NPS400 Timer bindings to DT schema format. It's a
> straight-forward conversion. The 2 bindings only differ in compatible
> and one required property, so the schemas can be combined.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
