Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BE97263E;
	Thu, 26 Jun 2025 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966411; cv=none; b=frnvfYPjxlQdyf2zvkqoUigQ3Sh1k7N+N/ujbgYMTafhOtvfGveh1PmpRuWE8nUNNl6F2OX2k9tnbywlfO05B3vr3MmAd3dcbtK+6Mk8Zot7qOhhiB5N5t34WAzp3WycwSSUbt/4r0BPa8MJdlhYrbOWfgBdV8oHL30/Jn68T9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966411; c=relaxed/simple;
	bh=/dhtCNwKik3qseApudE400UB4M+ojDUxzBOEx/mEhPE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZzaD18TiwMlnV1StBEVIpZ/gYZwoHR5Kn+WHbgG4wQgdRT8mgN2nUR5UmxmoWipJ+iQElZ73jGvyN7phu91ZXSkyhGuZBX+6A5njSokgg79MuV2WpTwZImNPreXiXct8qUQvMVmahrrpTwbJKje00bRuLcNdy4urQuISBdsylB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fm+G0/oi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fm+G0/oi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD87C4CEEB;
	Thu, 26 Jun 2025 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750966410;
	bh=/dhtCNwKik3qseApudE400UB4M+ojDUxzBOEx/mEhPE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Fm+G0/oiczdzQTnRHiK6sAsj3dH6QO/AsPio6mNB+B91Rk7sjWACVJUkzFv3U7dha
	 oNCDLxcrTqEX+Izto0ZbpQFNqXIFPDuSktbE8llrAjJI4peA3OjnM5iLgMfJUOmgEA
	 IBD0KYMHM2m1/i/WgmHo2IbYTl3fjhJTe+PN51kIZXENfZtdfaXoTvEOFAGQsUocIm
	 YF2xcMWDUj8NnqM4DQd38aO3KPcWIPveVCL80KQ9K0QD6l6tujofmPhq/IT6QMSAwG
	 7i2aFhk/Wsb9SvHohu9ggivoHaUpBT76rQU8TgH4TDHVj7/fVaPyq1KiFYzkZCJO/G
	 fpGfIA66v06tQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F413A40FCB;
	Thu, 26 Jun 2025 19:33:58 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v6.16, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250626191220.GA607595-robh@kernel.org>
References: <20250626191220.GA607595-robh@kernel.org>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250626191220.GA607595-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-6.16-1
X-PR-Tracked-Commit-Id: f75794b6077ec729f57de9a1ad24f14d288a68bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f02769e7f272d6f42b9767f066c5a99afd2338f3
Message-Id: <175096643670.1312595.4282270768459499979.pr-tracker-bot@kernel.org>
Date: Thu, 26 Jun 2025 19:33:56 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 26 Jun 2025 14:12:20 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f02769e7f272d6f42b9767f066c5a99afd2338f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
