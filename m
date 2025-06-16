Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44214C5B0;
	Mon, 16 Jun 2025 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112205; cv=none; b=VqDmHKk8SoWCRGEBhCbgJJEAYAg7GKlsiCxLHqx7gjo433UyKEjCcnziDAgJUxvWNPGeoYKO8u0NuMhkGfVR+bTyoson2nKQNMQSE+AGowKsOhfiSiO/vqa7BOxtm0PpoF1JIhp4pI4DP+OEDMW1xSEvzqpSvO9H0NDH+ohW6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112205; c=relaxed/simple;
	bh=KmLlsiJggLaioGxm5JWtZbVEvujaic5Q0beryzz+APk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZMFsWgmsvVZwFzeOoUmENjhtfGvKJco/2wZ1YI7dKpk/N4gJKjTNhL1IpX8lDd1hchIvHQdVqMIgs5F6qQKUZ1/m57TRRJal6OS+C5re4AleYCNmo9kWgCBtcWUy7IBo1H7BwujL0pR9cZ5ETUP7bEyKOvRBblu+MA7fhQ4pEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSbPtCv8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSbPtCv8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23649faf69fso48884235ad.0;
        Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112203; x=1750717003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=NSbPtCv8H+ORD0NotsGySUBm8qkK21pKh8w9Nz7+Z/k8Ya/mUO9q+WkHKg6+YLfi5U
         IBlz45D1DHxZYjpektvJD4jRIvChT9A0Y/FJxQb3q7KxS/gpyamnYUB+QRfyEE53W+b+
         qCbH4LBurxWFIothqtM0N3oCv20tbGRM+MxnPYIlINpxcNkMgMGvxuqrTvNGsND+rfNN
         z+5hW/13bU4JIt1vfoWT1Oi6flKQfzJR8yAiMJfGw+cGWUS8gCJt+EOD/dk2e7TCRH0e
         G81+bumaR7XoVmaH8qmbqdP/aSg1nEF/NgsYkrWOBBTfQBN8Q2rmAuX0zCpSKu4xM7X5
         XTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112203; x=1750717003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk/1RrX60JDmdVrtnshWrtDpcwloR4SRE8DgWiROa1Q=;
        b=iw6g3vaPXlT/qKN++esBl78kc9IzIpRHiKjw8Eqxert3bRtv3HdZolNqxMe8O4v3H2
         UPg3lBjIKSkhyXOqayU1Zqg4M0PAeYovb6EHOhKNyXMTpX0RMHVUaGEyQeBuK8E1eAdz
         r74UisqJYLSi4+DuAjgNStwmq9tXbCJtvLOc5S/63r31JAU/YXhmmWXxbGzeEJuibAWf
         8Jsgx1MJL6V4Lt4KQVh7uC52+ocoNv2Pe5jyqlu0bItrzT4pC1bI1Z3K6z0J1P0qsL54
         4Uk4mIxRHtuevUq8ZjEzePoOkNYXIPegR/8AW21z9b04hSCVPxGW2L1DPXozTkrmYsU5
         Si1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLaZVWRZz8zpUCHezQc50FTF5jrgH8IFt0FEjfMwFrZjjKuY9AoREyJi6zfsMWVWmruxp7JLqs0P9tWo7a@vger.kernel.org, AJvYcCXVOElRQRnjthR0NxVBGU8b5W9klqaF5jWNFNqSmtVIXWz2JEo6jYPpaI7h6TYvZR1KcDMFNm7GMs10jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPaAz7Q713lMKtA+y+kSYfTYSbS6La1XBo+lz5hOiESqJoMw0V
	dWF5Bc1//tfyaAr0/EfloZ5eNoc31dFeH/8Yav6X6OjBCMEod9Z6Sh/AgnbFDA==
X-Gm-Gg: ASbGncvTJdsPPqoDEeF4mKAFUwCVuH57gd930L5rDbCHTh/ubor5Vl1KAgSVTQTMWyn
	Xwnj6a01UQXRfk5J219dbHYgJ5wtxwpG9uHqrWMJly15vCbcBU+9k5ppR3tVOIYSS3YSNIZKTX5
	P4m+ygFF9/pU+ray5OzEp/S/6EA9Q7sqaFvtYOEkmZTqoK7Fu+Fm8fAioEti5ZvHiIYNk3eLLGb
	4eotFpotlBU5jgzo8AFlXxL2n6TmiscueW71/mJRjntyriIBQXmBe0dPa9NH3oqL4hfJmudGdFC
	MWmLUxOoFCRxCU3eXZRmFznx+h3OtTJgyVmmjRBgD987aQQEsQ2+rHvIkabh4vrdk0OneOMsmGE
	=
X-Google-Smtp-Source: AGHT+IH/vDq9MzidY2EpHhbnojUd1IyfqI+gwLmq2pgb7YkKLjm2cBD1/eXa2xI2DvQeLeHOp831uQ==
X-Received: by 2002:a17:902:f690:b0:22d:b243:2fee with SMTP id d9443c01a7336-2366b005d10mr141778865ad.13.1750112203018;
        Mon, 16 Jun 2025 15:16:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf0esm66382195ad.31.2025.06.16.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 2/4] hwmon: emc2305: Configure PWM channels based on DT
 properties
Message-ID: <39229deb-41b0-49ba-bd4d-33d57ab38ef0@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-3-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:23PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add support for configuring each PWM channel using Device Tree (DT)
> properties by parsing the 'pwms' phandle arguments.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
