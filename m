Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BF4259482
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942768; cv=pass; b=AXODx0CfOG4xOWplhL3VYbGifTp0TD25wPlWmI6YCw2P7yoSFnkUdqCy7IBP+FzI2dQy062AxMj4xDBxEciedYWlIWbq/Cgyo/xjHS70Omk/jYYzpiQAjEK37gFAeiIvgLYQXQoOziID9Qwgo+8ZrZJQfZQjdaW27ufIHhkwnWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942768; c=relaxed/simple;
	bh=6RQeM9UFiKX7M2WZjpjBl6bJt20T/4ZHFThUbCWilHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGB1Hy3EFt0mwofWWtLhb+I8vZv9FfuYpYaoGmANV9BlN6UaNfq/20HHQx3C67wRT6g2n1s6ZI2KEq/UT6ESqdcUXAfuJ/uIVCt1NdzZUU0fi9l5lnhBLoBywWQ1isTFVSV4TeOPgl+Mk9q9ksvE3htXJrgSjRqYc23sk9DnAyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VW9SUXNZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VW9SUXNZ"
ARC-Seal: i=1; a=rsa-sha256; t=1738942746; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b0nAViDGp1RGwFyxhncmKRPc2tWAdI7b6eKm0N1Jk/7HtkD+XU9kuMROvBrsjMVuALfMQSZozjEdEgem7NQ+qkEPQj6IueI9yUaBmaBxtWo44LFYcafxj0Foe+v46OEC7RuLdhHMDx9O88TLQvjuY17pOzmS7hImcX5P2DLpZIY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738942746; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=noPKdAGMhKnySUeZCxaTVh70QpxObYms/g1w1qWYI6c=; 
	b=i6Wh5VwJS9AusmV8gFFNqBU9H5/+Kpb5ePJLSWG5Xb044MFAoJ1MlsvTADadzT9p9AhtkP5WQGL5Wh+MBew/Adn7YAIr9ITxgSL49JRdaWMq88xnwZWJWT+ax0LwQDCRKsBtsCtsBHrpxKgr7I64UtOcuTU54iMTbdbemKk5mMw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738942746;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=noPKdAGMhKnySUeZCxaTVh70QpxObYms/g1w1qWYI6c=;
	b=VW9SUXNZxCSpawzAgc7nxTJ7o/klcGzTUqYt9idyYt1Zyb/ujIdFywfSZ1fYZR3u
	SsySLn7680u+xgvFEuGSbWvOCcgR/EcjRP1RsyI1M2PfvXuCwwZY0PJgPxeUvjTkN/T
	yaG1J4YQMv9lccKVob15PHVPOLujYhnSS1uiugpU=
Received: by mx.zohomail.com with SMTPS id 1738942744008697.8303695987066;
	Fri, 7 Feb 2025 07:39:04 -0800 (PST)
Message-ID: <b7eb131d-1ca6-44f1-aea1-ace991912c3e@collabora.com>
Date: Fri, 7 Feb 2025 18:38:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
 <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
 <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/6/25 18:17, Sasha Finkelstein wrote:
> On Wed, 29 Jan 2025 at 15:40, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Otherwise, the proper solution would be to pass info about host's page
>> size to guest using extended virtio protocol.
> 
> It is not fully clear to me, as to what exactly is meant by that.
> IIUC, virtio is a spec managed externally, so does that mean
> that i should write to the virtio people to add the relevant bits
> to the specification?

Virtio people will only approve the new bits. You who will have to
research how to add new virtio feature, propose and discuss the virtio
spec change with virtio people till the change is accepted, implement
new feature in the code. Anyone can propose spec changes, the process is
documented and you may look up ML archives to find what other people did
for upstreaming new features.

Virtio spec is managed externally, but in reality is tightly coupled
with Linux, all virtio people are also Linux devs. For the first step
you may write a quick *kernel* RFC patches to spark the discussion. Cc
all relevant people, see how much interest will be in the new feature,
ask how to properly add the new property if unsure.

Could be that virtio crowd will reject the idea of having a common
generic property and then we may try to make it private to the
virtio-gpu device.

-- 
Best regards,
Dmitry
