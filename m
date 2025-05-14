Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B12701C5;
	Wed, 14 May 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223112; cv=none; b=USZcJlJoI+/KLoXJtOnUDXk9qjFmFdCV3D2yz+y+mCkBr3Fep5JnodXJ0DGazQ8HkwcggvymRTeWuptdPJcVmf34oVyXRE343PA2H4n7XhojNdHGxacRo6yNIzV6YR9dJh8qr1KPSr5bVVL5nUW1/75KB3ULgdfyeG3wDyA/ZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223112; c=relaxed/simple;
	bh=ExcqgJJ6N4P7LcIRmzKY1pxYnvk0V9B7I8dKUQ0aCYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j3G6zFzAp4sWxp59PD51slCfmeIMk8gVKoUQsW0OstuWAxJVquoC1IcExqriuVqHl8loPswxmteMKF0p3ZIr6FQQfRsImKBx9rnWsxzG0bgl1I8WYiBsw+RT2xneJT5JNNp9vWy+j1RGLl+OV7+/kAAdbjLjtiOdlPUkwygsySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diQX9Pto; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diQX9Pto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFF1C4CEE9;
	Wed, 14 May 2025 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223111;
	bh=ExcqgJJ6N4P7LcIRmzKY1pxYnvk0V9B7I8dKUQ0aCYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=diQX9PtorWNmbG6bw//5Fx4zrrRUJvhp3kHrUyWVsIxzpEQdPK6YZDe9XcGMLd6Q6
	 47bf2Q2Qtk/vA9CI8dTv/lWzdBovh4OuVps2YP59vyIbV+0DHKbgQN7eFYt9l5f3yW
	 +lC8wEjJOWhyROskl51D9pnhRtxvEiOaZ4Fky+4y+mGYjwtWgp70/xbJXlvPwADTok
	 magEVBwi1gIcrb6KHtP7fl3dsstgA5vpzaeH4gbbYnH/mzz/PzULidiPeTg78Ta+HG
	 Ysw3IzH9M7lBG8okyybfTWSFfrfGdg4guUuEc0dKv39VEgOq+R4oFv1VHh9B9Nw7CS
	 eRKXk+IFXAM5Q==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
References: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] Fix minor issue in SoundWire slave IRQ mapping
Message-Id: <174722310984.91966.13044287872839649011.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Apr 2025 11:18:06 +0100, Charles Keepax wrote:
> Currently there would be problems if multiple devices on the same bus
> attempted to use SoundWire IRQ handling rather than the IRQ callback
> mechanism. So far only cs42l43 uses this system so this hasn't caused
> any problems.
> 
> Thanks,
> Charles
> 
> [...]

Applied, thanks!

[1/2] soundwire: bus: Simplify sdw_assign_device_num()
      commit: 5b1a2927c4f63878d2c108cebad09358e69caa20
[2/2] soundwire: bus: Add internal slave ID and use for IRQs
      commit: aab12022b076f0b385b7a9a78e1161bd2df5d1e3

Best regards,
-- 
~Vinod


