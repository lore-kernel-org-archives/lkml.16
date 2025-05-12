Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564062522B9;
	Mon, 12 May 2025 16:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068175; cv=none; b=WfbNbOhrOEzbG5P4gSJhwIQHdb2KblTK394QSG7/9POBE9m9cUxxLktry87gDdCXA6ICSHybn6gf7jCuGyrspu8SPPJmX5/wK0wp4OKWk7HNRClHpOleikeWWXaW0lJiCBQRl/DBaTBfao9PaBvwzKN2QofsNLrVe9FAz2hwIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068175; c=relaxed/simple;
	bh=dMz+NAbGlDLxH+dS4ZxCuUbYbiWmDkNk5lBm7JIkX7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDQRvKxCRgLWhZumpvVC2IWJ5xtjFR6SEJn/gL6FUIdNIfF3zJYmQgftpymPVgh2J/KYUkfnbFweU/Vc+Kw/2b0NPHDjfO53VsegGM70b1lSz4EQvlIZYk7/4NVbqUSa7/lrq1+fF6h0OLsDt7Wm/5ITM0A1o8KLbqaL4sbkX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqTEHOPh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqTEHOPh"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1445352b3a.0;
        Mon, 12 May 2025 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068173; x=1747672973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mos+vpa4zy8TYMWQiX/PGzB+92H+jeIUKLm8V1FWFQ4=;
        b=QqTEHOPh4TtNidbX/00kwVTmBVA4Dx87PSXrqHu8MDTEtKrFxKI700ZsPj6Du5n48b
         U596F0umT34K7P22RSnqiCDBeuMBI7p+TtMTQ31yKbhGwqhvdy2bTsQsTHszR6wzchgU
         rZlFQ8FFnxt3JQ2Na48p3lvuRzFS4WEcmTQNjagWbyx+vIfym9reMN7BwbLemJZO3BJr
         fEPdSG7FuljILCVFWY6iVwUFqWRThuYkrL7PqSHqR2clDfu/IJBW0nWiBLb7RLM+7hot
         abR7VzwqK0hggN19TQA1RJE5kdNWoEApIde83fU9oMEve2oxAuQepSDXnK7CZzXr9Lqz
         6FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068173; x=1747672973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mos+vpa4zy8TYMWQiX/PGzB+92H+jeIUKLm8V1FWFQ4=;
        b=aj9XhYqrRMKhcRXmmvZPUGWERNmKGCdS+JclWsiPADF9FOPs2XzqLBUsGL6SNBAftt
         Z7/SRlMBNumO5zpKy+KF6+AL8feo4akWRPdkr1LuzkdF/2ErHY4fplzZhtlRGeuivwYn
         mLeKvXu0OWsmSU+pCRN/j110uR4q1WcRFfWJ11VzQ5j8gjwnocosqG/VWzqlNb9nWTbw
         6uDABVpdtwpQ4PTJwrRjFr9O02zaACi8ZNh3DNC4mFEYEvTNwHULGnQ39wcu3E1A4/lQ
         IkQniXV5EaYUpY1tESnx3RjJKJVpZDaJ6as8g7WHq4PanMc8FAs6DbYwoTmcvWiRrqnA
         p6jw==
X-Forwarded-Encrypted: i=1; AJvYcCUMs23K86rAf3w1tNAY6NJlgvkHpp9FmoIARDYT7XRkof1Y4DW0S4gIzm6BUB1QbUC3K1j/Vl6ayuCPuLpD@vger.kernel.org, AJvYcCWXnI9ikD9swsRsp/nsOCReMIAX6qI5m8M3YmxMleekAsJXCQD5wBQxirH+sDk4ogKxz3l3RJQkJ7Oh@vger.kernel.org, AJvYcCWYIKdNNaxNTAn0isvjX9AZzTksHGVwLG2n2vSm9yHWmospmpp8yL9WDNJo2JQstMuvTI4dtG7kv6lM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63DF/QFyI38rhLguuVG5RpStkuhfXqF2QVT3LfA3gBo0iBVQ+
	cpgp/dx8Tuq45B81dH4TlU2/gcCrIG2Tl3gJ7wyugFr3y8OdXquA
X-Gm-Gg: ASbGncvfbNg2u3uuxbnlHlLprUHfT89TK785zJHoo7qC2oIEZZUyCM9GBmO/xBeEGvZ
	NuyqZ+XW53VR42LOW6/0AVoeVM2FFL7pM3D2Q/GiKOSXQh5GKwUzzXSj2SiyWTyPC9ngZvaWSU6
	pChMt7k5Ev5TEDmF3hfhVqSk+MUvFQsqoRA6YfC9+UI2I6YhlvC68OvAX+gL7auwgZTsF72+DFc
	rXbwRIl/escYetzHiCG7AnjTLbnhxwZN79fhigmrhTzIjI9LK1T+szoVQBPjtMLIbsrhJEXo6Sw
	POb619K24JyaTmOTbpyn7j1129LMVstAw07T1qCZPlxdXDgth30lZN9gMpeuGt91
X-Google-Smtp-Source: AGHT+IHZ1n+/Vs9sZklUWIa/Tu9598UYD+75acb2h8g969lq71eZX2epii5Gc/UjjB3dLArb6l9IZQ==
X-Received: by 2002:a17:90b:2789:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-30c3d62e4d4mr19610460a91.23.1747068173449;
        Mon, 12 May 2025 09:42:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb6f1sm9127616a91.47.2025.05.12.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:42:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:42:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] hwmon: pmbus: mpq8785: Prepare driver for
 multiple device support
Message-ID: <614b3eea-f659-4b37-8081-945dac25f4c7@roeck-us.net>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-3-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511035701.2607947-3-paweldembicki@gmail.com>

On Sun, May 11, 2025 at 05:55:45AM +0200, Pawel Dembicki wrote:
> Refactor the driver to support multiple Monolithic Power Systems devices.
> Introduce chip ID handling based on device tree matching.
> 
> No functional changes intended.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Applied.

Thanks,
Guenter
