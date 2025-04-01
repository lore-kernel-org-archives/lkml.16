Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75932C85
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473857; cv=none; b=T7cyzuPVwRjibq4lr7dVnkmVsFqDoV00aCFiWAq8qEcfuFCeryvFCAsOVy8q99KflPWHJ2pRCNjb8D/BkhXI9txQDfayWxQSNoGKJhwqvgwox7zlT8M/rQZzzmLMv5kmuExMh+cAQoEytiSjzUJXrwkDprY+Qyo5Gp4KxelWtUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473857; c=relaxed/simple;
	bh=vi3rj/1zQxrWJuP1/sNbUjl+3xF3RjUDRhBpiCHoAgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzoN9baXPZfTsB+kKexbBKPPQu1yB81HdtlX9kxpgnc9MDk1zKN4eNl6E6G4TeaOdWh+7GZgR9d/2CNkJuBdyAEGVN1bwzLCOGxF195o9cfkWU1WsKINdmB1S9+3qr1UnR3Nz8UA57F8H6fazXbUviaouMyhZSddXHMhSLuZ9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mUaTO5iP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mUaTO5iP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743473853;
	bh=vi3rj/1zQxrWJuP1/sNbUjl+3xF3RjUDRhBpiCHoAgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUaTO5iPhBZh7JZTg+JysyIrXC5i+0ydNrbM3Iad/UPtWe0hFhU5OzarRQcKQXLz7
	 vvituXsiyFwOFse8GCo65VDIjMiJrAjJExHK78GPIxmV1fOxivVw2yE9rqa8xaHiPS
	 nvQRzLfLkME6n7rgH0Cv9l+TQWbcwNjwgnHf7Bp3Tbmy5h3WpJN4NSPmkzVIGzBfQh
	 kr8dsogln1AXNJccBAhzq93HwSlmWU3czgFIT/Ut3AQQ5kX/8M7FakUvLSu+LGo/eN
	 ODP5e6Xrc2eg7SeoVn03ERj7gqqAU0H3limLSjXv+MckGNFKU8x+sYEVKmZ1ThqHuD
	 6Wk2rCexsQawA==
Received: from [192.168.50.250] (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3267717E07F2;
	Tue,  1 Apr 2025 04:17:29 +0200 (CEST)
Message-ID: <11f27552-9fac-4d96-980c-dcfcb093fa54@collabora.com>
Date: Tue, 1 Apr 2025 07:47:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-4-vignesh.raman@collabora.com>
 <20250328-idealistic-invisible-unicorn-961d67@houat>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20250328-idealistic-invisible-unicorn-961d67@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 28/03/25 20:40, Maxime Ripard wrote:
> On Thu, Mar 27, 2025 at 09:31:12PM +0530, Vignesh Raman wrote:
>> Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
>>   drivers/gpu/drm/ci/kunit.sh      | 34 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/kunit.yml     | 19 ++++++++++++++++++
>>   3 files changed, 54 insertions(+)
>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 9e61b49e9960..90ae57ca86a1 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -109,6 +109,7 @@ include:
>>     - drivers/gpu/drm/ci/build.yml
>>     - drivers/gpu/drm/ci/test.yml
>>     - drivers/gpu/drm/ci/check-devicetrees.yml
>> +  - drivers/gpu/drm/ci/kunit.yml
>>     - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
>>   
>>   
>> diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
>> new file mode 100755
>> index 000000000000..197b19d05fba
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/kunit.sh
>> @@ -0,0 +1,34 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: MIT
>> +
>> +set -euxo pipefail
>> +
>> +case "${KERNEL_ARCH}" in
>> +    "arm")
>> +        QEMU_PKG="qemu-system-arm"
>> +        GCC_ARCH="arm-linux-gnueabihf"
>> +        ;;
>> +    "arm64")
>> +        QEMU_PKG="qemu-system-aarch64"
>> +        GCC_ARCH="aarch64-linux-gnu"
>> +        ;;
>> +    "x86_64")
>> +        QEMU_PKG="qemu-system-x86"
>> +        GCC_ARCH="x86_64-linux-gnu"
>> +        ;;
>> +    *)
>> +        echo "Unsupported architecture: ${KERNEL_ARCH}"
>> +        exit 1
>> +        ;;
>> +esac
>> +
>> +export ARCH="${KERNEL_ARCH}"
>> +export CROSS_COMPILE="${GCC_ARCH}-"
>> +
>> +apt-get update -qq && apt-get install -y --no-install-recommends "${QEMU_PKG}"
> 
> Thanks for working on that.
> 
> I'm a bit concerned about using making it entirely debian specific here.
> Between the call to apt, the gcc triplet and the qemu package name, this
> not really a script to run kunit tests, but to run them on Debian :)
> 
> We should make it pretty explicit and / or just assume the runner has
> the right packages and call kunit directly.

Agree. This script is debian specific. I will move the debian bits to 
yaml job and make the script generic.

Regards,
Vignesh

> 
> Maxime

