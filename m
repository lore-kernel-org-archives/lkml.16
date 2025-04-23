Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A6563CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434633; cv=none; b=PzMMdnKTDGrqywEGkD069wmTBvGI316+CC0s2V/abl4PfPdAjRYrLt5vaPpBJ4b7Ng57ogGAHKIRfOIuh4U1q2huxMjapEi1vy/KmDBuC/pyU3L7qGSG0owjuBpxUp0Sb1sBvPzjxESRg88Py+uyrNGINzrWZUJztArPP9h0xDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434633; c=relaxed/simple;
	bh=1M4gU1rdCKNZAIoBVu71vjNzHlQADlHZN17wTgpwgKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SeLnsntuvipWWfDCZ5ePA5MPJ+gtteshL6FZQZo2xJHpes5C3jV3dHZWH5r5dsRvDxUzYWcRRuQk+M7LAPhuneaZNc5JS7OjjTlnJpbzCnB23iRvJrOXVQ4BQ3//uKuHvonFuudSscHx6/DrPk64KZIG15AUczV9eLkMPYHCaMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OQHdgEAf; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OQHdgEAf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L2Euk6kzM8QOnoJ52qxBeqSq1mI1sTop1CwuUA9C0MA=; b=OQHdgEAfhKMUttK9kYr4AJQLVS
	5dxhm8ilRPa9chFL5HKriaETHIujdCETPeM3mziBsUdB72ULidHc4Udn9k3ZJKc2VBxJFJ+ZwU4tz
	/DxQ1yi+Kjj0Mou/hlyI92XUj42UKrI9NWBQmU0tkNHZihMvaKxH93Al1NngIyUvY2B3uc8SC8ETr
	82Aau2RPQaE1v3iKSMQk/ZkxWJp2Q17uUObfT6w9SsnaGnlFzOMRt2TKYFeu19dUm/lltJLGTtTGT
	DaPH61vbWuSQxZi+tWfz3b10s2+fIStsGog+Qtg9jAZ4oWFtaPVz7MRC3U/INFRdVWPcC8vVmBBkz
	WTblFyCw==;
Received: from [177.98.23.232] (helo=[192.168.68.130])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7fHF-00739j-PD; Wed, 23 Apr 2025 20:56:58 +0200
Message-ID: <089fbd77-43ec-4ed5-8bcf-168a502c5270@igalia.com>
Date: Wed, 23 Apr 2025 15:56:51 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/ci: Add jobs to validate devicetrees
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
 <20250417030439.737924-2-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250417030439.737924-2-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/04/2025 00:04, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> v3:
>    - Add dt-binding-check and dtbs-check jobs to the static-checks stage.
> 
> v2:
>    - Use LLVM/Clang instead of GCC to avoid architecture-specific
>      toolchains for cross-compiling.
> 
> ---
>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>   4 files changed, 81 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
> 
> diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/drm/ci/check-devicetrees.yml
> new file mode 100644
> index 000000000000..75c9b009da1f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/check-devicetrees.yml
> @@ -0,0 +1,44 @@
> +.dt-check-base:
> +  stage: static-checks
> +  timeout: "30m"
> +  variables:
> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
> +    SCHEMA: "display"

Shouldn't we also check for gpu ?

Regards,
Helen

> +  before_script:
> +    - apt-get update -qq
> +    - apt-get install -y --no-install-recommends clang lld llvm python3-pip yamllint
> +    - pip3 install dtschema
> +  script:
> +    - drivers/gpu/drm/ci/${SCRIPT_NAME}
> +  artifacts:
> +    when: on_failure
> +    paths:
> +      - ${ARTIFACT_FILE}
> +  allow_failure:
> +    exit_codes:
> +      - 102
> +
> +dtbs-check:arm32:
> +  extends:
> +    - .build:arm32
> +    - .dt-check-base
> +  variables:
> +    SCRIPT_NAME: "dtbs-check.sh"
> +    ARTIFACT_FILE: "dtbs-check.log"
> +
> +dtbs-check:arm64:
> +  extends:
> +    - .build:arm64
> +    - .dt-check-base
> +  variables:
> +    SCRIPT_NAME: "dtbs-check.sh"
> +    ARTIFACT_FILE: "dtbs-check.log"
> +
> +dt-binding-check:
> +  extends:
> +    - .build
> +    - .use-debian/x86_64_build
> +    - .dt-check-base
> +  variables:
> +    SCRIPT_NAME: "dt-binding-check.sh"
> +    ARTIFACT_FILE: "dt-binding-check.log"
> diff --git a/drivers/gpu/drm/ci/dt-binding-check.sh b/drivers/gpu/drm/ci/dt-binding-check.sh
> new file mode 100755
> index 000000000000..5e9a439c48a4
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dt-binding-check.sh
> @@ -0,0 +1,16 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -euxo pipefail
> +
> +if ! make -j"${FDO_CI_CONCURRENT:-4}" dt_binding_check \
> +        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dt-binding-check.log; then
> +    echo "ERROR: 'make dt_binding_check' failed. Please check dt-binding-check.log for details."
> +    exit 1
> +fi
> +
> +if [[ -s dt-binding-check.log ]]; then
> +    echo "WARNING: dt_binding_check reported warnings. Please check dt-binding-check.log" \
> +         "for details."
> +    exit 102
> +fi
> diff --git a/drivers/gpu/drm/ci/dtbs-check.sh b/drivers/gpu/drm/ci/dtbs-check.sh
> new file mode 100755
> index 000000000000..91212f19fb98
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dtbs-check.sh
> @@ -0,0 +1,19 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -euxo pipefail
> +
> +: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
> +
> +make LLVM=1 ARCH="${KERNEL_ARCH}" defconfig
> +
> +if ! make -j"${FDO_CI_CONCURRENT:-4}" ARCH="${KERNEL_ARCH}" LLVM=1 dtbs_check \
> +        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dtbs-check.log; then
> +    echo "ERROR: 'make dtbs_check' failed. Please check dtbs-check.log for details."
> +    exit 1
> +fi
> +
> +if [[ -s dtbs-check.log ]]; then
> +    echo "WARNING: dtbs_check reported warnings. Please check dtbs-check.log for details."
> +    exit 102
> +fi
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 65adcd97e06b..ac2f498cfe5a 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -108,6 +108,7 @@ include:
>     - drivers/gpu/drm/ci/static-checks.yml
>     - drivers/gpu/drm/ci/build.yml
>     - drivers/gpu/drm/ci/test.yml
> +  - drivers/gpu/drm/ci/check-devicetrees.yml
>     - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
>   
>   
> @@ -117,6 +118,7 @@ stages:
>     - git-archive
>     - build-for-tests
>     - build-only
> +  - static-checks
>     - code-validation
>     - amdgpu
>     - i915

