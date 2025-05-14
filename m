Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42C275878;
	Wed, 14 May 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223115; cv=none; b=JDlxMWiDVzDS5IAV/4qfskcDJMUXmQx8IFG6CIMJ4PQmhz7536cma4fR8zUT5QEK9Oc1h70JMQR/6nrBGmpNgZFhOfQn5Ss8PovOU8UQAh+bjVUe4sNgNWcURAh9L0lUN4Y83BM6tqrWcjtZutfUCWZ9gKU2C/++5E8t5Jiaow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223115; c=relaxed/simple;
	bh=GkC5q9fTEHy+dj83iyn9Vy+tBjfxDK/kwPkWjKC2SSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F4t/hAaTF3gfEHkmgfx9sBHBTG+U9FsLSn0xC3XNirLfGbqw7TYGXzxwQNgFBPCaXu5IYwWew/6sypUPZibymOBiyrHOaXKFpffBF+AgpCp78Y3uCXu5LdpgEXWug3s+sdqU+GRLdOb8itgSgmHGy6zS9ZkEelXguFNk+G5WHoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emp6/h7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emp6/h7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31FBC4CEF0;
	Wed, 14 May 2025 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223115;
	bh=GkC5q9fTEHy+dj83iyn9Vy+tBjfxDK/kwPkWjKC2SSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Emp6/h7Ewboak5+4yv1yFMUzKPs7BkwFokovk22L1Go3PDkvCpNumyOsuy4baIoar
	 9OMv/f52wFeL4B/wrKLKjDTmbO24/BIxQr4GoNVue1sIxLhT6wigobYahvcoGCulao
	 C2wr0C2Mp5M+oPqRuF7nXzEwUVZGAbPJifTkAm8a/matZDsGog8n1eOQe6ZYmYl8Wr
	 uKccjeiOqAnFtfi4MnIwL2DzN2u9JAmdDCeBWXmJqYM0qVPEK4p0BOY3K5GySNQg7t
	 jZ0GmXtEHBtEvvwlmbDpBJ6BZfWVBY92X6Nu7nkg7DSMm+Jpi+0N3KybdyoZjox1L1
	 GWcWUHXJAY27w==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20250508062029.6596-1-yung-chuan.liao@linux.intel.com>
References: <20250508062029.6596-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: only compute port params in specific stream
 states
Message-Id: <174722311352.91966.592374766154766273.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:45:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 08 May 2025 14:20:29 +0800, Bard Liao wrote:
> Currently, sdw_compute_master_ports() is blindly called for every single
> Manager runtime. However, we should not take into account the stream's
> bandwidth if the stream is just allocated or already deprepared.
> 
> 

Applied, thanks!

[1/1] soundwire: only compute port params in specific stream states
      commit: 62ada17a6217a50fbd1b23f10899890f56effc97

Best regards,
-- 
~Vinod


