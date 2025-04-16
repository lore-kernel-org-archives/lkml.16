Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767B8221D90;
	Wed, 16 Apr 2025 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827057; cv=none; b=Doxn3MRuWgfF7SGFMVHKIY1ZEoOZe+jXDOP5j5CKDco1LjbbB+c5iH4vEbCSPSZccXMeg2P+xKwy01u+a2zJ8H4st0gFF93xGLbJGAxez5rN4szoAXstuptTd3IJ8Q+sSwgJipmRpRFyOpVgWfJCUKd5kz2QXq1vjXzS2tn83lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827057; c=relaxed/simple;
	bh=JKsIFPzbJHl+CJMTj3xxL68+Vk3TPEaJIx/uupsaiHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bQEGkfv+FMMPgXUSLOA4VzW+NpJU5yQ6UnyN34rxV2xjPQDsrzmongfz/G3740xRl+4ccr4/asqbYrl4VtPs2a9l5EKke+xU4yXTx8FugUaE6yfKwxntM1ZGWVo7kayLK15/C2L2/CyDiiSBylnFpyh4YsgHRlFh5aHpIHAWwAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwSjD8PP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwSjD8PP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D2FC4CEE4;
	Wed, 16 Apr 2025 18:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827056;
	bh=JKsIFPzbJHl+CJMTj3xxL68+Vk3TPEaJIx/uupsaiHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwSjD8PPQVc8qQCEMXGn/7zPAjkJrD8Gq1wsNsowspUDqZBJjHhUAw66e2a1QvKfE
	 farFSV10z/URrutYyXksgWKYx9KpybN1QqR2M97EsAIhYrSiqY04cSNVtlWnzBxkES
	 Ns9LSYq/TMwGo3ebGlgP7ECODFINCNJqd72wiuEUjvCMlS/GpcHffeU4fuZjfeGbQ9
	 87310KrzX2AZnTRF/xQWKro/xBgKfR1hWrrwSUUPeP7h0Y13wKWfkweZgEO8KZSh1n
	 zkWJxShmnlUHXRCu+BiYBycqCZwV1YypdB7I9pIknYkLSzRReEnzzjAovJ3bTxedKZ
	 46qCmYwx5iDXw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix missing error check for dev_pm_domain_attach()
Date: Wed, 16 Apr 2025 13:10:46 -0500
Message-ID: <174482704420.446874.1566095107641115785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250211092017.562-1-vulab@iscas.ac.cn>
References: <20250211092017.562-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Feb 2025 17:20:17 +0800, Wentao Liang wrote:
> In the current implementation, the return value of dev_pm_domain_attach()
> is not checked. This can lead to silent failures if the function fails,
> as the code would continue execution and return 0, ignoring the error.
> 
> This patch adds a check for the return value of dev_pm_domain_attach().
> If the function fails, an error message is logged using dev_err_probe(),
> and the error is propagated to the existing error handling path `err`,
> which ensures proper cleanup by calling clk_notifier_unregister().
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix missing error check for dev_pm_domain_attach()
      commit: 36eb51ac8bd545b6344c05a9860e4e65ba8d7a62

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
