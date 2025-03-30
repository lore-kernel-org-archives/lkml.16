Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905735973
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354413; cv=none; b=erqh+n/Fvl64RywbUI4wRxGjvIF8QG9Fd6CG6/VcfbpmDhmlm0q1RNBPqjtoGdMSCc6Bts3MX2jLs632IMJLNgbqIzNdNayJih284Lz4W9bsLWwJr+BuTeLCueurVnuKTGOtBxgifQiBnC9+LQ3hzSSc84px1qIy4QjBNICgx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354413; c=relaxed/simple;
	bh=264WT+/htHneIl3gN4jYFdYsxux8A+vzovoCXWZVB7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB1hyrCOp4chR9AfCYF3pfK58gVLO5MTu6BQhDRUgDDtLBcRhcvEpkJDImB1CY3wcTv4mt2qh/K6f6ZswJKG7uNgdqhKjOBfdBkqLbvHNboaMKMionOgNg7DJIs9+LuIJGFuOdsGDsu7GcsPQWg4iU5W7qzP/7GHb/1HkXFYCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSy6Xvni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSy6Xvni"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9fmfJ021318
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I+VLkI+ax9ERPcJ9cL1bscBH
	LAOnRdfptdTShhJuse0=; b=pSy6XvnivVuyjdrXmo4lbz4DHMSSlvvvhwHM4tjx
	oSibeMe92EF8qzuXerJx0c6iEigSCmGrmTvwdfYz+g6vg1dTjO/RriONPuZ+nVCt
	wgT4AJyUQZ17CDW+ewveJNWCMikRPNAnEJI0zaCZho50c7RCywVlLzb+moBDQ1Qx
	v/73pXfOx4k+kypTOlTfLZja5ZIlBszEH5kAQBLHih6GdkMc4AXvZg1dPQGhEcE3
	DjzCrRdirRJjd0LSa5Wvuw8lBIPk3HJfBlCr0Ef58QAe7vAwCgbiDSHO9bucpyu/
	Kko5ycKEKhsyAmDtMYUKqkJ1CKxDgl8o3XiC5BtvlWXOMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjqm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:06:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c549ea7166so594778885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354410; x=1743959210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+VLkI+ax9ERPcJ9cL1bscBHLAOnRdfptdTShhJuse0=;
        b=Wm5SIHVcfZwVtb5XYUPZuj/KiAI1NOESA0FxLc65W1Vj6YI6kWO+A//hhT0sOHzNke
         yG2U6drjiXsqJ1Mzy8kAxXqe8rKOH0b/+QaQn+6FucgrHnHxoumZcz4ODsdSVPP7l/Wq
         0sRfSPnxk4jYxoJSmDEB6+MAFhQ6y3I3Gn/Yc1qiMyk3sT0RfS47s09HIkB6aB9aTHMl
         ERtNqcar96SNH7b2OCJV6ZYvjs2e+5vGDT1inozYacIuwiqDRiLkngyoyPLYuPMBDdAx
         d96mGP/nHtsNPwQDIYO1TS8pLBxVMFaIO4SyXQVT5OK/RIk1iyFFfQff9ysEKsTRIakj
         aqrw==
X-Forwarded-Encrypted: i=1; AJvYcCVXRWFOeJK15RqHHvDsVDxoVsxH3nX/H1N+nc4DTUrTRfH7Ewx8l3e6tHkpausM/F3sYoQ9LqyHDiWdHZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHH+PGF2eUL5o3Ul5C+ODh69wUSV38BYh9Fpuf2X2l20dMPQd4
	MGNkkAz3pZU+vQyhrYjHIao1sXk0+1n9TrQu54BI2Kzoehnc2bK3ThzfhCfwVYedxnzeognb/s2
	vLuJDUVFgTuUWUsFztxeaGZlFyXvC2avXex+oa8C+/ogHwT951JGkXG/Vl5Q3+40=
X-Gm-Gg: ASbGnctbhj0MPpy+BwjagA9KRf8T3WmZIi+La4KjePToVTTvAs4G5lPgQvnGAlXVadf
	MyhoObBCvEW0KMTlEJjK4AxGZWchQrFAyr8U9KHB3bvDEe9x4rOOi58MqfjdxnyqJG/UM3AWPgB
	Lgzz7cbgcb1hBNyH2xaBtdUNo9uA0VbpcfDlJuZJvo5rzZljx3a0pvCZvfoDNGZ0nsvFWLBVXWB
	8OHPs3NxFxjb5VG1p/gz7tqGw/t/sXATiKCrbuUDWEyCnjUwAOinCwZh/IPcNkpFqLKXyjbM5t7
	q4G+GoMIp9hmpmlVlXUXlnQF3eQZBe5YTm4Ga7LYFsKJikbqnU1JTTRQLXLVy9Y1P+istIU7XQ9
	fK1E=
X-Received: by 2002:a05:620a:258a:b0:7c5:44d0:7dba with SMTP id af79cd13be357-7c6862eb951mr652266285a.11.1743354409814;
        Sun, 30 Mar 2025 10:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXdbnVrztDXt1+jaui5Pj368uoHZyRke4qm8wUBYD+KeXW481x0Ae0ktxhm8GoDb6798JqpA==
X-Received: by 2002:a05:620a:258a:b0:7c5:44d0:7dba with SMTP id af79cd13be357-7c6862eb951mr652262485a.11.1743354409461;
        Sun, 30 Mar 2025 10:06:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c00edsm948945e87.32.2025.03.30.10.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:06:47 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:06:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
Message-ID: <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327160117.945165-3-vignesh.raman@collabora.com>
X-Proofpoint-GUID: 1vlsz02IBLs2iYaRqQHjM8ZiJlE1YQr0
X-Proofpoint-ORIG-GUID: 1vlsz02IBLs2iYaRqQHjM8ZiJlE1YQr0
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e97a2b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=Mlic37jVtDCE-JpPDfwA:9 a=NV4wyG33IU+YRRekGPUaDRyT+ac=:19
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300119

On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.

Can it really succeed or is it going to be an always-failing job? The
dt_binding_check generally succeed, dtbs_check generates tons of
warnings. We are trying to make progress there, but it's still very far
from being achevable.

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/check-devicetrees.yml | 38 ++++++++++++++++++++++
>  drivers/gpu/drm/ci/dt-binding-check.sh   | 18 +++++++++++
>  drivers/gpu/drm/ci/dtbs-check.sh         | 41 ++++++++++++++++++++++++
>  drivers/gpu/drm/ci/gitlab-ci.yml         |  1 +
>  4 files changed, 98 insertions(+)
>  create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>  create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>  create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
> 
> diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/drm/ci/check-devicetrees.yml
> new file mode 100644
> index 000000000000..5f0c477f7578
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/check-devicetrees.yml
> @@ -0,0 +1,38 @@
> +.dt-check-base:
> +  timeout: "1h"
> +  variables:
> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
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
> index 000000000000..2a72bb89c013
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dt-binding-check.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -euxo pipefail
> +
> +apt-get update -qq
> +apt install -y --no-install-recommends yamllint
> +pip3 install dtschema
> +
> +if ! make -j${FDO_CI_CONCURRENT:-4} dt_binding_check >/dev/null 2>dt-binding-check.log; then

I'd rather see errors in job output too.

> +    echo "ERROR: 'make dt_binding_check' failed. Please check dt-binding-check.log for details."
> +    exit 1
> +fi
> +
> +if [[ -s dt-binding-check.log ]]; then
> +    echo "WARNING: dt_binding_check reported warnings. Please check dt-binding-check.log for details."
> +    exit 102
> +fi
> diff --git a/drivers/gpu/drm/ci/dtbs-check.sh b/drivers/gpu/drm/ci/dtbs-check.sh
> new file mode 100755
> index 000000000000..a0129d5a53b0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dtbs-check.sh
> @@ -0,0 +1,41 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -euxo pipefail
> +
> +. drivers/gpu/drm/ci/override-ld-with-bfd.sh
> +
> +apt-get update -qq
> +pip3 install dtschema
> +
> +case "${KERNEL_ARCH}" in
> +    "arm")
> +        GCC_ARCH="arm-linux-gnueabihf"
> +        ;;
> +    "arm64")
> +        GCC_ARCH="aarch64-linux-gnu"
> +        ;;
> +    "x86_64")
> +        GCC_ARCH="x86_64-linux-gnu"
> +        ;;
> +    *)
> +        echo "Unsupported architecture: ${KERNEL_ARCH}"
> +        exit 1
> +        ;;
> +esac
> +
> +export ARCH="${KERNEL_ARCH}"
> +export CROSS_COMPILE="${GCC_ARCH}-"
> +
> +make `basename ${DEFCONFIG}`
> +make -j${FDO_CI_CONCURRENT:-4} dtbs

You don't need to build dtbs separately, dtbs_check includes dtbs.

> +
> +if ! make -j${FDO_CI_CONCURRENT:-4} dtbs_check >/dev/null 2>dtbs-check.log; then

I'd rather see errors in job output too.

> +    echo "ERROR: 'make dtbs_check' failed. Please check dtbs-check.log for details."
> +    exit 1
> +fi
> +
> +if [[ -s dtbs-check.log ]]; then
> +    echo "WARNING: dtbs_check reported warnings. Please check dtbs-check.log for details."
> +    exit 102
> +fi
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 65adcd97e06b..9e61b49e9960 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -108,6 +108,7 @@ include:
>    - drivers/gpu/drm/ci/static-checks.yml
>    - drivers/gpu/drm/ci/build.yml
>    - drivers/gpu/drm/ci/test.yml
> +  - drivers/gpu/drm/ci/check-devicetrees.yml
>    - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
>  
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
