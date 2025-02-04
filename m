Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391F537E5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633017; cv=none; b=FKofOFFTQEfDcFlE8s0FiRoigkGmz2Hz8noTi0VTuUvdQF8/cUwnA4HAUhtQ030ol3ao5LhetTRar496cU976KvaeKpxuQI9pYM9tOZ/pS98bwudlMsvullUV0r3lr+MIwf28p5776JXJG4Yey6xh2YS7buIDl/SBO8v6kk/xTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633017; c=relaxed/simple;
	bh=gQJg4Yjqg4bWR3kSEamLIlUZAPB4Qx9PFeNNXZoa5lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4zVsnsrdY9K2ZnPEc3EL3WgdJZnWfr26P9i13QCCA5uoGH0jNNK64f8d/7UML1c1h6EpK5WY7w0Bv1GMuGQ1bW/F5KLK6/RN9VAd2OvqCVbiYPEyo75dg0Vtpl+sFCuQhPTcBaLLyDm7LvhSK8Ts1ZwTAtwxhHOoHtsZaWQ/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+2EgQi6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+2EgQi6"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f6c90b51c3so29978867b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 17:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738633014; x=1739237814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROq+7dop8/gAZioS6LiNRBVOkjkfWTu5NLRN5pWfuk0=;
        b=q+2EgQi6ngOhd4dLGCCZZJVm7WJXXDCun1z5h9NY3FuXQ0rx8cBL1P91MVKMVwmCxB
         poI3bD+LBjaAdFdMtqySnVkHOC3JzOxRc3p0/d/wD+9PCZjRGLGftv2kOC1G6eFcMhfB
         vv9p6QeohdaNIKh46lO7NTBqjBgLWwYsffZWOC3UWTj8r0yvzKKDtUBHd/PHv8d68KMK
         DRxlGfEKXTSKbVRw0dXTUgnzP64bDKAsW+IC/6kuJo5hIyvQE3YhJXc6oytriWT3ssND
         F3xTKM9/69I/SE/xKu2IX+ETX4ONQZ+m/eqLJGrg1Oa9+Poyw5oE4TVKDHxtAZ5c+uLG
         FNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738633014; x=1739237814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROq+7dop8/gAZioS6LiNRBVOkjkfWTu5NLRN5pWfuk0=;
        b=Dk+zlWzp1i3xxmxzqUAhqj94Ck7idr7ucy4Mk0WH74kF5drj7tXydT9v0mapTBBFnU
         dLhTM1paFEXgWVeSPV0PCjghzC0PaJ5kLGkFaQmCiE0LctzL3VYRETM1mTyuzldSKuvu
         em3Zo4AcDC7iQfNm97l0taRpmWwXMiYA7f8qDg90nZKJBqayuhOFKLWsxlu+zuy1T2AE
         sPd5q7cUqkFriXkeq7W22d6l7NLlWVLOvnLMLaeZCnPfjBGbv9sHnbK0A2FjbIUCrFdG
         x7co0qF2psLnHi7LHxIiyjicd31bgpqly02TqOmDTRM49jJ8JrJ4NyTYUPrWMHhnW8yf
         4GEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxCc2jxz8yC0T/FfQMQGyTRIt0CF8sXfblNgAyicB5JQ7ZaBF65s8nrCer2RFn3TOj34RPeN0rG16dDVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU6/EHrcWC2LNVUYJPfKxx/Ei4j/X2Ntqe5a46hoZ/zS4zNZ+3
	EcgO9g7pAdZ/9vbQ4k43ZRHzB5fr9DDvu1dAKnGPfusRCj5c3m4TATmWgYFYsrfLqU0sTDnpsgw
	ZsnGy6wvbzoVHfv/6Q/fDIzZ6wxpneu9hDkojqw==
X-Gm-Gg: ASbGncso9+wCA9XNkURK6XJs42oDVBQzq390Og41B2V5HOTjmRYk8nLC6/PRAzXhDcL
	k8ES2FKj06ksqfUacCosw6XKEGy+jmPt8RNZNIpl12XsTVaEEieE1vgtC8yC9oddsMVwO4P7dP7
	jbuLEeObm5T1njnK33vI+Psa0mssmv
X-Google-Smtp-Source: AGHT+IEndGqJLe3lRomYw81FxRc4rJi4daHHHTKmvJkj4axffR2/iXurAfxujNYq1cogoGYH72n70X+vXXmF4hJGdBY=
X-Received: by 2002:a05:690c:c99:b0:6f6:7ef2:fe74 with SMTP id
 00721157ae682-6f7a8426a5dmr180536937b3.32.1738633014293; Mon, 03 Feb 2025
 17:36:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-2-b3774120eb8c@quicinc.com>
 <vry7yib4jtvyc5baruetqb2msy4j4ityv2s6z5smrz6rqjfb5l@xoharscfhz5n> <6873e397-dbc0-4c30-8c08-a65ee7cd6e01@quicinc.com>
In-Reply-To: <6873e397-dbc0-4c30-8c08-a65ee7cd6e01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Feb 2025 03:36:42 +0200
X-Gm-Features: AWEUYZlF9xRy7fPmY8vHPfUe0fIEvkxweH_j9r0Xv-PAz5SBxJgUbog5Km9Pvw4
Message-ID: <CAA8EJprjxMtkefY+90cLGVgz-bDf=VXnaa0eH4ESAC6nf5vrLA@mail.gmail.com>
Subject: Re: [PATCH 2/5] phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Manish Pandey <quic_mapa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

On Mon, 3 Feb 2025 at 10:03, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:

Your email client has corrupted all quotation levels. Please fix its
configuration so that you can not compose HTML email. Or switch to a
normal text-based email client like Mutt or Gnus.

No additional comments can be provided to this email.

>
>
> On 1/14/2025 4:19 PM, Dmitry Baryshkov wrote:
>
> On Mon, Jan 13, 2025 at 01:46:25PM -0800, Melody Olvera wrote:
>
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>
> Add SM8750 specific register layout and table configs. The serdes
> TX RX register offset has changed for SM8750 and hence keep UFS
> specific serdes offsets in a dedicated header file.

-- 
With best wishes
Dmitry
