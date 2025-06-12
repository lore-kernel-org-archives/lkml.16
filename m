Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7D92F4321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728381; cv=none; b=Yh0lGYNKLzK7tDjX0RyELddJMgEuv14jSvBI8J3d1VhR0nhfLnE941/cminIxVtVIdluccza+/FgC49pCKpdGXJxt1jHOw8sfU2+guRLHvHv+BD2f+Mcsl5pT1W/+YO8y21HTNxv0elgv+Vg3UBje/PkVlmuB8Udciwy+sJbvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728381; c=relaxed/simple;
	bh=czXIVD6xQjvC1tEbZIVsAxrEf357Wbyhje47vKPmNJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PLtL1BSBd3uCs2SbFuVfni+ayihO/hw7i74+77rWCUBcJ+E0MqRcGQnp7iRCZIQJcInArcgcXFlbGb9J1/6wyujw0txEmcQyABOShGyu6XDbhkd+oCP6WLtOqqK7txBgguUBiltegawCUSOsQRW6zMb0h5Z0C2ASL3UL9YwmrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FobjXkpf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FobjXkpf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450d08e662fso959335e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749728376; x=1750333176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH9zpyyeQx03Xpt9F0YSvnLpGJjqpDHk0YVCL6WUMi0=;
        b=FobjXkpff1OC/6aLAkU+164UgetZbovzhE5f6ioENUEldH2P7mwyUMnNJNspXrgkLg
         hURsyNj+9N6M6u0qtcI51w4A7mL7x/D/LFal60ZgyPmwbDKf1TgXJFQIR7H4d3a4+3Ql
         KdBCz5NO8D0H5qFkhauCJytNuq+3qx15LB5lrcH6zR0syBPAkywGdwnpMvNbZwgcj3aU
         CVUMRFl+CWz0OiFiXI/G645wOaQXTRE/DBDMrR0AgiQ+Im4jqJ91z51Z4MHZaLFrvNtM
         kKW/6cUGAm6I7XDLanUpuiouWn/OMA3P1ntwq6wj7Qd74smZ6VjFqkanm6FiWSGk7p6N
         NTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728376; x=1750333176;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BH9zpyyeQx03Xpt9F0YSvnLpGJjqpDHk0YVCL6WUMi0=;
        b=NOZr4OxjnpuAQNJ6VZnqjt6AnBNEzhnYSiltzuznbWftYMXAXgBFXZqzVth+8ueQ9e
         Pl6XlvpAiEhB08pAcs5BGcWwkTUJsuto2xrBg5VsWV3kJx4XPYVPswaYkl8ulvO7sI23
         IGIvMhmXnocQ40TlvqnxxKyvyxCcI7SwMIfoioGC8+6snrGgq0tZsgnBnWLylL9fOE6c
         ex9TN5PPscX8nYZ8mMDahzzD0A+tpCShArIbCWvW+JdNbwMY2bcEapwSBFx9t9DYCxB1
         yAxbI7WPvVC8ZFJO5gJv1UIEckvv/V1sXveGs8atVfVoPLUE+HyfFSL17T3KVWdOcUau
         8znA==
X-Gm-Message-State: AOJu0YxfLYhRiaS4VbGyc9KU47TRVN9JleAttmE1G+3cO9LbJbki4qmq
	2YiIx/QCYpxmkpTTziPLlX5ZgcN00F8IubWfNe08QiY35L5f+zYjeowG3RtjTJlxKsq89WnT/6P
	Ps9jQ
X-Gm-Gg: ASbGncs2sgsYynnfdBF6zSdeVYUuNa/vUsYlgh3EE2d+AxXp7RPkitkpMslT0E2Pbhb
	JvVxtwznSvFQw5gHzIjUHg+SVYRFfspMvijeHaYApHQ7QA0spZg4TVmsgAQtdgeRJfMpkM59gyq
	26KAT0WHucaUHBN2tIjubAQKl8ujNzt9H50+JzjUvalukV/6ovffqCmP7j3ZnIDxd/sThPt8c+G
	4/udHKxEk8vI4H4hq+zYmKsM4QRFt+PEVvCaMCp/8LqbhM8nNmtxV6hD7B0m4sUCGVcD2DOwMt/
	XU02K87g/WQEMKYRzY4TSblhw7cfJFa58zBUD1F/pA0iVJFf1YvREJDmSMLdM5YqES56E6uh/+1
	M8sXLp1s=
X-Google-Smtp-Source: AGHT+IEcpObNjeWZdXRhh+Gz2mVKzNVAOuBcl9lUX8WtlsYJJ+gSEvmYwY5GXQOg2ReoFXO+QM0Mpg==
X-Received: by 2002:a05:6000:2313:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a55881f23fmr2471607f8f.12.1749728376305;
        Thu, 12 Jun 2025 04:39:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3c763sm1750430f8f.62.2025.06.12.04.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:39:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250611104348.192092-12-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-12-jirislaby@kernel.org>
Subject: Re: [PATCH] memory: Use dev_fwnode()
Message-Id: <174972837497.91877.6617168191559505764.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 13:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 11 Jun 2025 12:43:40 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: Use dev_fwnode()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a0be20055d41028a121a5acc140e17c73d7541c5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

