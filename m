Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764982F1FF9;
	Thu, 26 Jun 2025 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965141; cv=none; b=DQdf2Y6J+1/2qwGzRs43QZA9z39wrk3eG8Vvh781rY2HwyAg4GNYoTuM55QtRAVbYKkvsuQ+hGL6FlHVRka9B71xR7PtlS6naOUPyJBt+pN2gbhlDH03S9X6gfjC4a6vwYMryylFVdAP9FwevTgK0yb97j9jg+/vFEJYlqtOjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965141; c=relaxed/simple;
	bh=jXqq8ALp7/cXMrus+lIYpypu6okE8U6Zc/Dz5zie+aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLBA8oiqonYfZ72kNTSUu3cF4sTJArIMFsRdfz2CgUSXV9rEhl8zvst/yymJ+ZSfkQwlvYmwzGp5qZtGB2LLb8qTzQS7O5G61t/IJxAKklUTpNRXuH6F93P2yY2gId6lsY2+8MM8Jj/eZlUdoins00FEtsMyb7qJmzqLC5cNiD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0FpVOw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0FpVOw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D527AC4CEEB;
	Thu, 26 Jun 2025 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750965141;
	bh=jXqq8ALp7/cXMrus+lIYpypu6okE8U6Zc/Dz5zie+aM=;
	h=Date:From:To:Cc:Subject:From;
	b=C0FpVOw4E0OFZrBTHoFSV+w72DI0LNbO7kuqWhPPVlinhfa9YtWsy9GU0WQEbUiV0
	 wvT54cFyVlRGxR0mG7qLer1cF99GRNLLmp0P+hJ7GlGxbQj7T2GQ2+iYaYYQXNxYGL
	 TN1BZ35WmoT8zBPyR6XcmZKrW0wNAnXjeJgC+RENfi1B8g+zzmRU+sRzVcnnxPhnfw
	 U8jHB+qIsPqZwG7jwA5XQS7SdJOwQdh4TW4QCqjY5/5JXIZ4hAeN1YRRcCfaQ+6oFg
	 2K/vALPvay15uyYHRvLqVJtsDk6zNWEA/POSAlysPbaKQmy8kkImYsoKhGAqe1g9Tr
	 LMGcpk1Bc6R3Q==
Date: Thu, 26 Jun 2025 14:12:20 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v6.16, part 1
Message-ID: <20250626191220.GA607595-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull a couple of DT fixes.

Rob


The following changes since commit 89ab97de44fec8eecedd1d327d418c5781303c05:

  dt-bindings: timer: Add fsl,vf610-pit.yaml (2025-05-28 09:20:59 -0500)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-6.16-1

for you to fetch changes up to f75794b6077ec729f57de9a1ad24f14d288a68bb:

  dt-bindings: serial: Convert altr,uart-1.0 to DT schema (2025-06-11 17:43:11 -0500)

----------------------------------------------------------------
Devicetree fixes for v6.16, part 1:

- Convert altr,uart-1.0 and altr,juart-1.0 to DT schema. These were
  applied for nios2, but never sent upstream.

- Fix extra '/' in fsl,ls1028a-reset '$id' path

- Fix warnings in ti,sn65dsi83 schema due to unnecessary $ref.

----------------------------------------------------------------
Andrej Picej (1):
      dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix lvds-vod* warnings

Rob Herring (Arm) (3):
      dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
      dt-bindings: serial: Convert altr,juart-1.0 to DT schema
      dt-bindings: serial: Convert altr,uart-1.0 to DT schema

 .../bindings/display/bridge/ti,sn65dsi83.yaml      |  4 ----
 .../devicetree/bindings/serial/altera_jtaguart.txt |  5 -----
 .../devicetree/bindings/serial/altera_uart.txt     |  8 -------
 .../devicetree/bindings/serial/altr,juart-1.0.yaml | 19 ++++++++++++++++
 .../devicetree/bindings/serial/altr,uart-1.0.yaml  | 25 ++++++++++++++++++++++
 .../bindings/soc/fsl/fsl,ls1028a-reset.yaml        |  2 +-
 6 files changed, 45 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/altera_jtaguart.txt
 delete mode 100644 Documentation/devicetree/bindings/serial/altera_uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/altr,juart-1.0.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/altr,uart-1.0.yaml
