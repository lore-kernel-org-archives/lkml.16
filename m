Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59825F78E;
	Tue, 20 May 2025 02:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707331; cv=none; b=N3ZGroIwfnItSagrkwt6Wp+d6pyyHm8kNvdbKQBV0ZDKuY4ydWDCO5BtVvC7wUR5D1B6DhrjkKpg7YdlktLT44AVGnOIgC4VUFe7kmCb3lKowl4LZPe8Tje27Op10AZyK8mkXaOygVlKhQz0chf1mTEzIser6tl/Lh5pFUQ2IFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707331; c=relaxed/simple;
	bh=kM3T16zJ4tkT1j275NruSblAEcep3iVnPMpLfOPKqh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QectvyNT7iY+/IWDko2KoDT10q8mVvheDxZsCmpKNxrpaV/hKlEExIp36XCSp3TyCnagBTEATIrQyVEt0XZG9zql89N92SHgPTxVdVdGGi228IKVU0Tc86GBjNl9N79Fu0tApZIe7LF4LNaKkw1JVJAE/3NUdrU1Zhl6xSOMQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQni616B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQni616B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A74C4CEEF;
	Tue, 20 May 2025 02:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707330;
	bh=kM3T16zJ4tkT1j275NruSblAEcep3iVnPMpLfOPKqh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQni616B8HWohwChkp0PbdksIvPQSyyrg6dJgivM3fZeW0imMtR4XSDgLzxlsLo3F
	 KHL90gi0wdpF6QMpZD61tTGzKtW9irauY3DnrVEyeboVNtVUcEykNQJvy9BhbUtst/
	 xMSc8TYq4y60pTBm8DBNAGNkY/dMKjjmtvqtPhyV6AbStfNW1XNNd+xjsJMJSrK7rV
	 9bVXGq9PqHxnuk4uFXb5Cydt+5c+W0KlmQ6L1xnEBIQrPwNx+DkbPAHwa4nN0zelcQ
	 K5lvFUnEzkzMTJy2qTB7XzKWy4zXOVlBlAkoOT3h2hR4Gd99RKskZ6WUGrBI1dO/g5
	 k2O77SJLveHAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_satyap@quicinc.com,
	kernel@oss.qualcomm.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH] docs: firmware: qcom_scm: Fix kernel-doc warning
Date: Mon, 19 May 2025 21:14:57 -0500
Message-ID: <174770727725.36693.13072337384690284102.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
References: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Apr 2025 13:38:24 -0700, Unnathi Chalicheemala wrote:
> Add description for members of qcom_scm_desc struct to avoid:
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'svc' not described in 'qcom_scm_desc'
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'cmd' not described in 'qcom_scm_desc'
> 
> [...]

Applied, thanks!

[1/1] docs: firmware: qcom_scm: Fix kernel-doc warning
      commit: 936badf282388be78094e55bd5e2c96f86635e48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
