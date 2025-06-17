Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D792F30CD;
	Tue, 17 Jun 2025 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195897; cv=none; b=sIeyIwiH/xSK9eFIm5amcmyC+RaGEM42Mte/FxJbn3wSjloj4pB/FpOI9PgU0oJ0pB7TCbTb9tZGoyl2+csnFPLcflsmVJ0ljK2XTJ9WNFlmCuYmu8G72OV87N5IGGYvNV31GWuE53txChhQOSTqk4l8adfiW4d16iKpGlrlWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195897; c=relaxed/simple;
	bh=DJbkqMWNVhp6RzxR59KwLHmr7Bxrxf4E53JdX3+iVFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+XlYcGrS8xxQURfaIQAQoyt17BtAOALfAcJb8A2fEtZUlcbVRijVDnbiRiNFHD0sTDnMEwBmFpeh7XNVoTYTYvmNmbxm6Qqnc5SB+tExg+6ceyTqb+kmfWysIAdcZkjtWAJeEdFhb5RDhpB70ib04pxoffvzJjFYwIbOTbyi8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXI/9Zhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXI/9Zhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAEBC4CEE3;
	Tue, 17 Jun 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195895;
	bh=DJbkqMWNVhp6RzxR59KwLHmr7Bxrxf4E53JdX3+iVFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EXI/9ZhuYhjQiQgb4QHPf3TgVOfI+wbd71D+HyfgaTIzVm1+xj6JGsk396NHBNRdo
	 a5aSDI/naZaSfFdFMC9o92wsPFW4qXnxGZmU1jEq98337bnItwuKgrYwUVdDzf9aRq
	 TyxZf31f7+/rXvCCYa2d9O0neLSo6y29nPwwyL4fOshdnlYk4J48mB3WAa115JIL04
	 8ixRudo/ZzEfyzj4HAf9xb58cdLz42M6jnOOH70tFapQJrHaimM9Vb8gP+QP4trSUf
	 s8r0azN1ajZ8XqR+4pyd3i748GdADvblwclGOcTqtZBd58y0jmi0ovaKBUmyh3YJ9v
	 VH53uUyrkS4wQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] soc: qcom: QMI helpers supports for big endian
Date: Tue, 17 Jun 2025 16:31:24 -0500
Message-ID: <175019588864.714929.3442085286960343581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 May 2025 16:35:28 +0200, Alexander Wilhelm wrote:
> Fix QMI encoding and decoding for variable length elements to support big
> endian platforms. Also fix endiannes for QMI header.
> 
> Alexander Wilhelm (2):
>   soc: qcom: QMI encoding/decoding for big endian
>   soc: qcom: fix endianness for QMI header
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: QMI encoding/decoding for big endian
      commit: 3ced38da5f7de4c260f9eaa86fc805827953243a
[2/2] soc: qcom: fix endianness for QMI header
      commit: 07a4688833b237331e5045f90fc546c085b28c86

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
