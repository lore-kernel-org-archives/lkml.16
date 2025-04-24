Received: from outbound.qs.icloud.com (p-east3-cluster1-host12-snip4-1.eps.apple.com [57.103.87.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB9221296
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494301; cv=none; b=S65POFaXqxr+daw9/Zh4CZPRJ8yOgRVbOLB9+vd/szf4ubRkGgn8Zpu80YzCUl1cHh+Ij85XGjaSm20wqhuGh4H8ifFN2xjnHZOSkBf/MiBUkXmdGu+WGpkzJYDP5I0nNNjibKSI4X+KNm8yftNxVDAlxLQhd7fO4vdo7P8shRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494301; c=relaxed/simple;
	bh=6Ttio08oTSADz4D/Sdqy63zgVY4f9+DlzTAqpC3Lvk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc6PuUjykL9osjnEGUEaulwRT4QiMyVq3xdoYyrnpWPLAAou3+Bwfp9b6/crrWodWeamGcCEdk+qnffzxjf9uY8QU1qj3oP1OIC9wUuX6fpFyRs/Bp3t6kMKvKXgiUXv7Qn8jnCVa9Q2Ni6EVhrtM057c3AZOUg1rv7v5f3yEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=tsVQ2KRi; arc=none smtp.client-ip=57.103.87.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="tsVQ2KRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=6Ttio08oTSADz4D/Sdqy63zgVY4f9+DlzTAqpC3Lvk4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=tsVQ2KRiyGCIZQLb4G65HDJs1vpeeouwjaelagCLfL3NXGP+UVlNwIb5WoMjjuSai
	 Up7tFBXQPlHkmoShSz9jPaZfofxQNKyaZD7dZi8xpfOtSQQsxB2d+9ffn0kayCd5sc
	 JdltQBCD2bf+Mu2jRtjk/4nZmo6CcNxlbxE/D+NymdjMI/S45Y4FQ5kLUmE1Q1sHm5
	 +f+9FJc4wgb/L+X+SsBLrDMxQ5+bZ6zXPSB1FXd47il192LmMsfu4vGdzx95QatMLP
	 dlJbQnzwtoyuUr0FK0K9IiWD0W3MtcVijawtyQy05Gq4ZLbPXvpVmutBVUOMJMPPIE
	 Jrr6jl6T1c0rg==
Received: from localhost (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by outbound.qs.icloud.com (Postfix) with ESMTPSA id 8D1E11801326;
	Thu, 24 Apr 2025 11:31:37 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andyshrk@163.com
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	daniel@fooishbar.org,
	djc@djc.id.au,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mail@etehtsea.me,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re:Re:Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
Date: Thu, 24 Apr 2025 11:31:27 +0000
Message-ID: <20250424113130.7431-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
References: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-ORIG-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 suspectscore=0 mlxscore=1 clxscore=1030
 adultscore=0 malwarescore=0 mlxlogscore=190 bulkscore=0 phishscore=0
 spamscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504240077

Hi, Andy and Daniel!

What is the status of this one? I've noticed it went to archived.
Is it good to go or not? Any further recommendations?

Thank you,
Konstantin
