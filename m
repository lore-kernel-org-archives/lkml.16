Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBA274FEB;
	Wed, 14 May 2025 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223114; cv=none; b=Xug+1HTc8nIrV3bi58PkVrY3xNULq4gjRmA6xvWOJH55vQ6xck4/QLaV0KxXMSB1GlxbHqtA8CnDGnRBXTKuBm5bK6SPboQzvyWtU2E1tk/deriPU8LMg+8WNmEe89oseQh05HTQecaOsceaCUFRU96puvbQISW6S6GoIYIyGeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223114; c=relaxed/simple;
	bh=z7rY0zdhiv1fdjfEUuq2oA9QOBX2CvO8RkZwhtXztAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N/gBYlX5suZHEKOmp+mStrqLpFzI1qP2uvrLICvub+4I+f9ivw0POHhpqiW2HO34pzRQ40cRNQ/SKUf5TWgN0gb5LC99HIv/tZcjWUGm4mC5eS9XMP5il8nWAZyAguFIX+xkjxiAPeks5vUEBBE6eSpf/lOk8zQ08J8LCQmx9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BygJkCj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BygJkCj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA98C4CEEB;
	Wed, 14 May 2025 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223113;
	bh=z7rY0zdhiv1fdjfEUuq2oA9QOBX2CvO8RkZwhtXztAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BygJkCj6rrDRG/P5sqpnHSf/3rQxZJ2mFETkWXIeGuerDYqy6cYh6CV/lK9giWh/g
	 EzTSvfvQBgjGvO6aw+GGqFbx/UI0BaxZI3BBGMvf9oCD0JNIAbDe0G3M4rIt6rm8u7
	 01fi8Ksn3B0OEV16ytQSUhJbLurW3mgCsR6usVyR7+xVjduKhvdnuneK2lCKh5MSHq
	 TjPSYYQS8BciHOY2tK69+fhsprZEslqGvtHOpWXQjMYiYC7kt4RTa1Q/gJ/1qdYFGQ
	 hKeqnaxfMnpgk+q8tuEFFGcpmXl+xDofV03eMxTmT9dcDNWYDcYawD2yk/vGtZqJUr
	 XdJf3kNzAGPmw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
References: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] SoundWire/ASoC: Intel: Add suppoirt for printing
 ACE3+ PVCCS (mic privacy) register in register dump
Message-Id: <174722311156.91966.13329123879691612605.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 30 Apr 2025 15:47:12 +0800, Bard Liao wrote:
> This series print the PVCCS register alongside with the other SHIM
> registers in soundwire link register dump when ACE3 or newer is in use.
> The change is mainly on the SoundWire tree. It would be better to go
> through the SoundWire tree with Mark's Acked-by tag.
> 
> Peter Ujfalusi (2):
>   soundwire: intel: Add awareness of ACE3+ microphone privacy
>   ASoC: SOF: Intel: hda: Set the mic_privacy flag for soundwire with
>     ACE3+
> 
> [...]

Applied, thanks!

[1/2] soundwire: intel: Add awareness of ACE3+ microphone privacy
      commit: e1f3f5be9e8e730290ebe6d490383af4d77f0f38
[2/2] ASoC: SOF: Intel: hda: Set the mic_privacy flag for soundwire with ACE3+
      commit: d028b57b77f91e4643abd661640f345cd34522b6

Best regards,
-- 
~Vinod


