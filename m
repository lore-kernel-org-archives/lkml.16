Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FF282ED;
	Wed, 14 May 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238026; cv=none; b=Bd0LXW8FPfFhG6oLX3J7Q9vv+2moqDUaAHN33iXhyAeoUaC8wlvri/D6j4GPVNdQF9cpijHd/5/cNgI9mTzBZX6/w0SbhSMDDlJH3EyEf1INeHMP5UNGmt2jXVL09ie3PW53VBMpl7RhMbRUaLwkHW9eZkb5vEG4rAD1uD+6jK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238026; c=relaxed/simple;
	bh=vUJao5RA1FECEfxSWQAdWVDba5icQlbRNS/+nM7I1XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8v1D9t+r/Qw//9rej7zlM8jSMWm5LZ3rrcjR8uBhVrCSvTH0C4dCEW3bKw0WjX2zzGAcwgEP3zjivn3nO+FWAe3bKw3lN3Uw9HzN5iapGXRLnWVVireHmhhRVU0rD00Igh24smMKM1GBbGLDBeghWjAVvkpbv4C5/iXz2SutyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y78eKOdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y78eKOdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2EDC4CEE3;
	Wed, 14 May 2025 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238025;
	bh=vUJao5RA1FECEfxSWQAdWVDba5icQlbRNS/+nM7I1XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y78eKOdRFrLUEiUBM1SjlXL7oRujznCCqxO9wf2G2oOD9TN2Ebo6oDaN8UqBIfxeb
	 aWnLSJptIzyb6deKVSSSaG88mP/gOk6blsI0ixxK0+ugCcbLT1sTUEH+wPSqqoFCzd
	 NrDwhODn1LHwSSlOcsHP+Z2yBK+YWGzd3S51vCqksTihqk7j4GjdvM6dfDYLosMJQC
	 XgEAIne+vE4btJf6fvGkPkSjMIwj7l1TtRocV9S04g7Jz/aJY1+DhtiW03cOXkXjxc
	 sJZ9LtUJAz42jN4OnviELHlaWXL/q9M6Lhuf6E6+CxlrrIShttRlcoaJckbAksStvY
	 mbWRrlg51jbGA==
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tglx@linutronix.de,
	daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: (subset) [PATCH v4 0/9] add Voyager board support
Date: Wed, 14 May 2025 16:53:34 +0100
Message-ID: <20250514-spherical-spindle-0315375167ea@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250514095350.3765716-1-ben717@andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=566; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=o01yVTTzZFhpDmtQ1GzGggNP3iMTUpd+Z6Ki8ySZNTY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBkqe2plgqcGXXx24ZJRo7eKQ0z/e+93Vx9a5G6+3NHcd vhTz3+OjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzURGhpvcXafWN5TLGk0V kuDQE2MseHjPKVR0cfSi1uzww2WX5zEyHFtzLcn4jujdLJevx6ZcnXtsso5DEvskM7Fwjw8iR5f 1cgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 14 May 2025 17:53:41 +0800, Ben Zong-You Xie wrote:
> The Voyager is a 9.6” x 9.6” Micro ATX form factor development board
> including Andes QiLai SoC. This patch series adds minimal device tree
> files for the QiLai SoC and the Voyager board [1].
> 
> Now only support basic uart drivers to boot up into a basic console. Other
> features will be added later.
> 
> [...]

Applied to riscv-cache-for-next, thanks!

[6/9] dt-bindings: cache: add QiLai compatible to ax45mp
      https://git.kernel.org/conor/c/51b081cdb923

Thanks,
Conor.
