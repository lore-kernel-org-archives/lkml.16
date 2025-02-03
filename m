Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC5288B1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586532; cv=none; b=MQHjgyIdSwpuuSiUCYXyokSRAKNxh+R4sX/ar2UFZmRnNOLU7OiPvbfsc401X9zbyyclSGTwunwnd/WboaeLbvJ45KcaPZ2HcBngOnzey5fh7K4uMmbwSNoxERIkCksCWVpr0QMKrwZpr+/Weu5gz742g8cHfLepYxBhEEeMfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586532; c=relaxed/simple;
	bh=qck+RUZdaH6SiwJAXlwGHAviQn7p4zuHmijm0xzda3c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsG6FjX4nchdhkdcRaE5oMYkHPIQSbIlaar94LSLbUePWUOSVzGf+PRNiOgzFT4keOYQtmRzYi4N9036waFd/mqRKbDQlfQYl5vWAFPGt1nOVNTM0gteFJGfF9assP2Lb2NZMFy9nRooISN9qNiikraCPPQgRgWBQRUMB5iuOys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 689408344D1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:42:00 +0100 (CET)
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 39BEE2003C8;
	Mon,  3 Feb 2025 13:41:52 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id CD63C40042; Mon, 03 Feb 2025 13:39:33 +0100 (CET)
Date: Mon, 3 Feb 2025 13:39:33 +0100
From: Etienne Buira <etienne.buira@free.fr>
To: daniel.lezcano@linaro.org, tglx@linuxtronix.de,
	linux-kernel@vger.kernel.org
Subject: Kconfig condition on BCM2835_TIMER (and others)
Message-ID: <Z6C5BegftEGzwkN_@Z926fQmE5jqhFMgp6>
Mail-Followup-To: daniel.lezcano@linaro.org, tglx@linuxtronix.de,
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I want to build a kernel for Raspberry pi 4B, which, according to the
dtb, has a bc2835-system-timer. This device is handled by
drivers/clocksource/bcm2835_timer.c, which is built depending on
CONFIG_BCM2835_TIMER.

However, the config option is guarded by "if COMPILE_TEST" condition.

Shouldn't that condition be ARM64 || COMPILE_TEST (ie be selectable on
arm64 builds)?

Regards.

