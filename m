Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81019F461;
	Fri, 27 Jun 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026190; cv=none; b=g6FYWUYCRNapKCouGKH+WBzpmDYIJ1+21RZgkUq5iTGNuhvOhjD0atZxvsy/ThcliAuZN6RM/IRMQ2oD0chWggkItsRR8ZxkWh1CrtfaqqObFwtNinesMdhT6Ed3gvtOGxwsRcyqcx8ME2uro6TGkKp65iMvqMzTfJKxpZrzODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026190; c=relaxed/simple;
	bh=+Vg2SDvLbTlYtiD21pxDbYD6+IG8r3EWbgiH1xHwNHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p+DtZWYovVahg2QBY/CLVedC+P10529PCjfegLejZsdZbXn6zQUcXdACC406yvnNSxM4Oq+tjUnfiThvarCbwlJLLtOdHDJfZRPtn3tXKEmMR4cBEPS0h4yZWl69MHeRvf7Pycl05q3NM2NdQ5qIGSOJmNk2xFbF1RTzXTc1MWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNh/ZMfz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNh/ZMfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC6BC4CEE3;
	Fri, 27 Jun 2025 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751026190;
	bh=+Vg2SDvLbTlYtiD21pxDbYD6+IG8r3EWbgiH1xHwNHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pNh/ZMfzCMUHpsyxxY9zMiCmkxbEx4RCV26dl5aw5TyFJH4aQ//Cj5fH/ZShh0DWL
	 q7N0g7gp1jmRdLvySTNsnqE+SYxY/cHpwIxXLUAZjBEktRFWF2yEEwDWe3nca6Hi+A
	 PonfFqv9dn5NxZdfhF+mFSkIR3CZrEp5+dSabD9TstgwkgkIG6O0m32GaXgsqboftT
	 +nIGyA9TDtaGqAP+uN/Bay+PAuCiYVrdTP4quXthZmR7IbnC3SaDN5sq38t56n1R3j
	 tlKmL990gl0DFHZYPLnJOsiMUnzWCNNiEBeiHta59Z5LiILJPATRLLS9sN7oLLJo4P
	 iSdqCPnmD/g9w==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250603152836.1069326-1-Frank.Li@nxp.com>
References: <20250603152836.1069326-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: convert lpc1857-eeprom.txt
 to yaml format
Message-Id: <175102618816.6916.17165812030870481659.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 13:09:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 03 Jun 2025 11:28:35 -0400, Frank Li wrote:
> Convert lpc1857-eeprom.txt to yaml format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: convert lpc1857-eeprom.txt to yaml format
      commit: e315a752a6a5399d711fe413bd3543306ef5e421

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

