Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97219CC11
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091121; cv=none; b=cVhyZDTrKk35R/c4uczSn+F7iDIpZ2cNspUKbQ+7e2b43M9+BXxYACwqwcnmFCgx1aRjc6iT1FaLWcf8na4OML1Q++sPyb/E7/bC7JK98f5rYsuc5RIraWYnoTfOCWKFzlFs8SYPZKMCt7D51XlMwb1ETkCIvR0qrP8qfexoAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091121; c=relaxed/simple;
	bh=yYRohU/7oNSwFfXRdHiEbHST7HR2eGwqnNVwlczmaKc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KE+uH8Ng+jMYAlibN9RA4lKd0IcAZSrCN9+J0q3VIEXiP54YVNMJPAjXHm878sPn/ZP+fH9YLqyUNeNrKhEy8Ds9Y0/j7rYjVbCKeSOU/p77taCngkOCdmMJcohn8LY8ciZ4OHzC9X9wpCcvjLPALJnWzyiq2edWeslVDHjzL+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTPCUC5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTPCUC5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E1C4CEDD;
	Thu, 27 Mar 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743091121;
	bh=yYRohU/7oNSwFfXRdHiEbHST7HR2eGwqnNVwlczmaKc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KTPCUC5zw0Poq5OjNluqgrmi8pXqZJjJSrBNyBdCsSjMOHVdmnDC8lideAb9L6s3+
	 hfmCPs110RE+v/1gyle6w891YDUtl+o8/pYm5oz9ElJNz/znIPeyfiRncNyFRNP/4D
	 mS7is6wPpbw0c6VAkbZYCND6NwtOWwbupDX+TSfL0O75hsGFo1yjdIn1ZpQGuJAv4i
	 QhlqZ5VcXqRhmUTaHgjc1DhIDsHH++dK5a1VoiPmnQagOC2d716a0NvF4cGIJ4a1bv
	 YcJ9oR95J1sXHG8gt1RxYjEtkMK9qtZ1VZFnZQHxrm3gHqAnN/lzbkQkue/J1V6elK
	 ZVbFfVna4ccrg==
Message-ID: <98602072621543af8cfeaab2d19bf1fa@kernel.org>
Date: Thu, 27 Mar 2025 15:58:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add refcount support
In-Reply-To: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 27 Mar 2025 10:55:40 -0400, Anusha Srivatsa wrote:
> Allocate panel via reference counting. Add _get() and _put() helper
> functions to ensure panel allocations are refcounted. Avoid use after
> free by ensuring panel pointer is valid and can be usable till the last
> reference is put.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
