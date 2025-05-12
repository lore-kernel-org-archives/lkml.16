Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA23FE7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747081836; cv=pass; b=k70ZTYdStv/7mXRHTIgpgqQVFs0ASQp8Wqo8DyJQIjqKOhz+pI69QDKdFAOOMWVgiM2zFKcW7rg92DaoejB5kIN6t4bs7ULrdhuN6gOb2WfoXAMVLd4upjEu9MaXzbr7SxP/bAHxE47pqj3oZiPOE3ZOAkO0c8m+UK7VgERteRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747081836; c=relaxed/simple;
	bh=dVcW4spjNBdoQ8twfGcmvjbost0R99zAeDwoVzfneqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2SkuCa6v687ufoth2BDfUf40O2GAAwMDfjpSmoW4wu4ZHBj+MQlkreK8C05FI2C83VrV69mgxHUToNd6XAczUGZWpPu0Spz7pXG4NmAIhceYp9HoHH3PQfeDUxsqfIwJQmwXyoWr08SmOFSdXDlxsDFIMYJmXJv9MzOygmXU9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=fossekall.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=i869kQLF; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=VlXzukrp; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fossekall.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="i869kQLF";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="VlXzukrp"
ARC-Seal: i=1; a=rsa-sha256; t=1747081629; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tARlmZoyuwgXiJ2bKrmPM5iavTSVlKTpXww+TMyIb5QQig9upe76/vGR/8LfWtYQ1K
    vZJuhZjelIKE+WYzl8GO+6XRrzE0kPtZvjAkKDEoBGzdMFVUupusizSN0ea6YrbkXK0d
    Q++piAtFMaaf/x7xOElkrjcXJIFJBp9CZdlV5zSfGE4XbVlMunBrCezJpgObUKc5DbIO
    bPkncbSSEs6JsvJj8CQoUzsGpgipwfqUga9pAIF5gVoTPZzqhbMV/oQCE+0TPZRCYLov
    EPayvF41G8/e45KuUnZAhUrsYoqovT69u+BW8e6HcZ4OWmbt1aCv8Cd4PvssQd0/zSvR
    4hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=lcBpbyfI2r5+LH/yMihvuOpaXWp/smIR1tKvuYwhFZSq/64g6a61ikbKF5nvyl8Dxz
    AeyABbjJWorgMWlNP0tU1mfBaIGKzFrwNyhQ+SErpsSGNPUlfzsokPC8sp9IZQgBYY/F
    zgEhGG+aCQj/kHfc7Kr96GmRSAqWPPUhj4WMN22juGqpbP45la5de/Ht04J+eYEJNTnr
    Mm4hlx3d7FFCvv3xQBir9264zMcV1Lg9EfFU4a8SRYeucJ78nPKtZoANi2m6vML/4yLx
    MM/WpfiQZ/GV4g5gsHEmOVSbZu6hOVWMnfoMeGdUqCIvc+pLM7UqkoLm0zkT5Qh+eGXH
    vFPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=i869kQLFtIoAtFkdzXT9SNX/PAK8AlAvg6UMDIYSS+ijuPO25FAnDaT7OflcuovSs4
    8gNlxgqDy4ov4FTRd8zYynB1erwa/dArl6/Q17LxuucMgwSrg33HYm/D/OmmUMlW5uuX
    R+CGN3pXVNAjzkHLYt2GT3/GtM0gkGc9/MZO4yrDnqYK8mhle7RrzHLTIGs/6GVvKA6J
    ruO6tCr/qlQUBpWtXfgdoyFSQPTROFXqSmI1+GLd9wE5ueHqBvK6X5OtRWd9G9oKQnHG
    MPeeTdL3FZ2JaMA84g6NTdqmsT57IlF044rN62KnWvyImq9sgGycgOfRCap2KZL6rfRV
    HZtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=VlXzukrpPaXIfwjqkZgo4O5jRiTbh8HkYhEGnXP40OHvbcrZfBX34LFFpzl/QzHvFd
    IPNgRnwgy7twlaqBI3DQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b3514CKR8d9R
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 12 May 2025 22:27:08 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <michael@fossekall.de>)
	id 1uEZjv-0005UG-34;
	Mon, 12 May 2025 22:27:07 +0200
Date: Mon, 12 May 2025 22:27:06 +0200
From: Michael <michael@fossekall.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <aCJZmm8rC0RwbcBX@a98shuttle.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi,

with v6.9 and later there is no output on the BananaPI HDMI connector.

I have bisected the issue to the following commit:

   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")

With this patch, sun4i_hdmi_connector_clock_valid() is occasionally 
called with clock=0, causing the function to return MODE_NOCLOCK.
In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is 
always!=0, maybe that gives someone a hint.

-- 
Michael
