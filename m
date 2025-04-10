Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1279916DC28
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291783; cv=none; b=UiCsIzSDqwgmOveYmALhTd8Y46aGrMp7KXvB8fS7awznKwq8obhFHPmhRGc7Bu5C4QzJMACsLZhTJWipxsIIZmJRv7FGmpFu8MDY9rtAi6Uxg7Oj0N9TWwn4ttjPGd/hs5VFRrX8MzKDYhD4Fw5BxV5krpOYE7QeLJ+UFqtD79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291783; c=relaxed/simple;
	bh=bq0+zzz8gpCkI2u450fNXD8guqy8VI6lmKIFlJ5A+p0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lo1t3IGxTrYno3rvXOw2VPfKJ0IdkZgfpSiCazbHU78lgX9Nr3WaLX/SQdwlGG562abntm5AO4Z3FkL9onsvJdqTR47HutitaU5ZsuT+RlN5s/K6XJbUdKmQ8WivoMj1JF3kJnNQkX9ZKth1Al/hfL1bu+i1JIuMWUcu82JMbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m21pi5dx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m21pi5dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744291780;
	bh=bq0+zzz8gpCkI2u450fNXD8guqy8VI6lmKIFlJ5A+p0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m21pi5dxxrSSBXqvw+Lyd7FzPWHu0dX7/dlcX+47p4IGO66l6SB1QKoOMKaNlnbUR
	 zT3YYOI7RlrudsfYWChxfDI0jBAS+Rql4G4oKBKcZDFBAs4iSd+lV+gk05ciJxNMgV
	 e49f5OrWuWKC6NY4flQTg7zb0DT8hni0W/GsQOFONzp8tdYBLhUTsT+S5CRIEQDqVN
	 WXSQKtDDxVdXaV68oTP5qblp+UezyrHwpDwO6usANbldLqF4d3NncM5hKlxceSO+i+
	 Ixaf3UlAPBcCfdrLFeoGyKk09mvjM06Tpiomd3+bepcccUwd/PShLm2YIUjK8AuVt8
	 SdlAShjaxYzPg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C566117E101A;
	Thu, 10 Apr 2025 15:29:39 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:29:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] drm/panthor: Use 64-bit and poll register
 accessors
Message-ID: <20250410152935.25ba7255@collabora.com>
In-Reply-To: <d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
	<20250320111741.1937892-3-karunika.choo@arm.com>
	<20250321085306.0d79ec5d@collabora.com>
	<d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 14:07:20 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 21/03/2025 07:53, Boris Brezillon wrote:
> > On Thu, 20 Mar 2025 11:17:34 +0000
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >   
> >> This patch updates Panthor to use the new 64-bit accessors and poll
> >> functions.  
> > 
> > nit: I don't think it makes sense to dissociate the introduction of the
> > new helpers and their use. Could we squash this patch into the previous
> > one?  
> 
> It was previously requested that I split the patches into two to ease
> review. I can merge it back into the previous one in v3.

Thanks. Could we also have that submitted in a separate patch, so we
can merge it while we're discussing the rest of the patch series?
