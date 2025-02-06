Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A06225A5C;
	Thu,  6 Feb 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833897; cv=none; b=LGIo0zbJR6MmN79GUJ9m8RLjttsEWmsd45CElUMS2f8wAJK0GIeAaU/L1W6qIcZ1K7xkE5Z500IncbfM7STbY6jEvQi3csjMGDpmKupioFEnNaPEwC43r3+n2qjkieOqzVmIKYkTKvffBFodY+t7iM58rHSMYPAHVYZdAz3+2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833897; c=relaxed/simple;
	bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkAHMhkgxLEBAzCGOGDhvW292yAS7F4ct9A0kYdqtn4tBG+/TBSyLaTO530VUL5OgWTpptg2asAoI35UGw37z4tDHeKwjLQZQfSY32TJTxl5gCDafrfca0gMRoJRSykKEwseWzdcaEKcP4VnxMITQdS0f5gSlVocB96Qq79Uhmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8G1eoLb; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8G1eoLb"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so580089276.3;
        Thu, 06 Feb 2025 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738833894; x=1739438694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=S8G1eoLb6Vox20L2Pwk/81mSE3dmLs5pV9/4Ip3Uf5rlAiiEzn52eo43GiBnfju1Ao
         Oexw5drRuwAEdn0gQ6Soadk2Vh21IKS5LMsvpQOt/YrSvdCs1XgsKoneM+V4oNRm0c9m
         aPwK8CgYpJaSx6tmfdsmMIMvvc+eN+AAEWZDn/04ZCtgVlDeC9ByGSJZl0i+Ed0ADEvK
         w54qxFM0Pszsg7YgKq50pIDnLAIIW1R/mattPhifvQMJHJsi+sxqNe1nmHjA7m7xuS7f
         8MCPW9kKDLuz6cNfXkpGGRPCID34ZtoOjFIyR5TCygqJAbZJeMqTN0L4ASJrE/eMuF2B
         1fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833894; x=1739438694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=GSsGdL/u9t3iTI9VJdxeM/4M0y6wV8udyV9jICTgaehjWf6xXggk9Vz3G4x7fNlQsW
         Aar9iZTF+tZpZ6lI3Tg4L5aBa8dM9XpjvJ20FPN5Zqc3AIOHzfsB34bPp46Byxkb0Hka
         5KRePpg3TG4s6u8RPj2ZWxLTh/Tv7acUMozNYIm8TWY+gnVXd8z686FqTjPMgNeGSxgB
         lik52uR/DgOsl8jSQTI2MAdDNqF0ZUOjukBLXpuLCBQfT+2psc1Z/rIKTKVflR0PyMuA
         7Nli74wV7pclGfxJDEKbFplRhhjUOwLN30j0jEoqTlyXqjdq6OKW01shnXeLopuSi/c7
         IJgw==
X-Forwarded-Encrypted: i=1; AJvYcCVnN9mEL87dYk8zCg/8k5KTbFQ4koPMBU9bhL5+ouzJXrO3nlhu8n9ZFBgG3t2oAN0sHaqeQH7QJhJ+@vger.kernel.org, AJvYcCW6OXCFiCoQVWYWm1VPLnmVNvpV5ORsyDEMXPiWrYZaDNV1Gb52UouZZ0cqagYhKLPmof50UEDNtTn8L1Do@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJ3UCI8Y0Kdn3EJtm2MmNscgkaKdmsbevn8208agr+DYRdOPC
	L1wXPJaTFRoYi86luzxcGDhi1rzucxZrEbfqEIurG1WNxz9Dvx3GubYNPebgrD/a0qyyX6I+xTt
	yZrOCc6010b8BD/hB2i8eo1M+64E=
X-Gm-Gg: ASbGnctpHJtoio3ZqwiB99K1NwivIoJeOweF2B+6ad8qgW3bwOXf1NpOEXhm1ZyhPrY
	lSKyEx4y4672KXEOveY6uNhZC7v1SqlHrcl3+gLHu7JhpHfnydsvkrGZrjzfxon2LQy347H6EGQ
	==
X-Google-Smtp-Source: AGHT+IFbC6DM3fJVG17MrSGBXdIfeROMfW7VK5TSEM0p/SsdBlf6NEx0KbnND2bApOZ90AM+CmqzpnxiCUvcGg1/hdc=
X-Received: by 2002:a05:6902:2843:b0:e5a:e604:78df with SMTP id
 3f1490d57ef6-e5b25b95544mr4817982276.17.1738833894216; Thu, 06 Feb 2025
 01:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com> <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
In-Reply-To: <20250206-caped-premium-squid-595ecd@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 10:24:43 +0100
X-Gm-Features: AWEUYZn9JAn4vxk91DxbpJulbYrsp1RnWuViBY7aesXFIweT5vWahzqXS6ccsNo
Message-ID: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> Sorry to figure it out that late, but how do you plan on maintaining it?
> Where will the patches go through, and who will you send PR to?

Downstream development is done via the https://github.com/AsahiLinux/linux/
repo, then send patches to ml. Not sure if i want to send PR personally,
it will probably go via one of the drm trees or via asahi-soc.
