Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46D2BB04
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743336321; cv=pass; b=SCuh8MpLG2+0ML7r+xOqMwwa1MRODo1dWtgA5MwBgnjC2E2nitHxd1V9Kd+21NRdnCNWlqo+uazl0KHusRMKa83dgiAUgphvkHl7nD3Yj3Bef7SvrgUM1DeWimmpFbc3cUNqTBUKKKKr2OP5eEr2i5j2dPnbduW5tABNEdof6VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743336321; c=relaxed/simple;
	bh=wHLGoWFBo5YvZAEyHie+2xVyde9ziJq3tmbRRF8p4zQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=erKxnydBqHxCBe2ekXFMNukJRYFzmOScA+uumf8NJ+jEf3OK8vqe0Nwe/lKefyDyXVIgeg9Mh02Q8oJO79tSqwNYJ3bKdsKVREmcM1uoi9Ew+YlYgssdv5k0mgE8qX8GY4EU5c7XFRn842qxR0C+LWoO8c6MEpOyLobxWFWNsKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=WgbCVWQe; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WgbCVWQe"
ARC-Seal: i=1; a=rsa-sha256; t=1743336295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ngBBVrPQmzffRS95xiwif4eLpbKPEp6RYTlEwBG0EAeh204PgYt1EQxa9yoONgVDc6HAY/KJ4FpOXYOqzsmiBHxWB8zNZ/sfYM9QjT/fIfkOgF09E1ETAS2yYAz6xh17diYaOjtIgpD84LU+AumKeAtp/2tnVj1AkExZxF3ibUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743336295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cqOTHyVwuqlsTFcnXqzpe3w998N03y04ggCtpRPGV2U=; 
	b=Q8zLZHzpCFwEWr9diKZeJckWezcAWCSUI+pGfz2v0HQjrekwcHQtkMqu7tmaHMeCnVceR5lxUQUXQ1JEpeYPDTwVRmDQzWGcUtuUZ+xZhmQlUrYGAJZZX4CBUW3VUvjmHY/e31+Ryk3C2wG7yfD1WhGZpClRWU21hxlJCqMc9Ac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743336295;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cqOTHyVwuqlsTFcnXqzpe3w998N03y04ggCtpRPGV2U=;
	b=WgbCVWQeWg5Uny7bJUO9EyooYp5D97+bYpkCma/U4EBq8qyBCL7yT59ANHBaz/qG
	JR6MDVDlxeyI6y4UflUQdambgAGw2VXTKGHB6kDSUkOIcIwL9zeC0ztbwuRuVKNTUWA
	19Wlm6rUldoS4H+TMuhVXfrU5rM9g7tTbnpZmFs8=
Received: by mx.zohomail.com with SMTPS id 1743336294729887.841721981765;
	Sun, 30 Mar 2025 05:04:54 -0700 (PDT)
Message-ID: <467838dc-a549-4c15-84ea-1322043542d1@collabora.com>
Date: Sun, 30 Mar 2025 15:04:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
 <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
Content-Language: en-US
In-Reply-To: <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/30/25 14:57, Dmitry Osipenko wrote:
>> +	userptr = virtio_gpu_userptr_from_addr_range(
>> +		vfpriv, params->userptr, params->userptr + params->size - 1UL);
> Is it possible that userptr address will be same for two different
> processes?

See now the vfpriv->userptrs_tree, i.e. it's not a global tree.

-- 
Best regards,
Dmitry
