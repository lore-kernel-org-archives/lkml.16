Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90671F1305;
	Tue, 11 Feb 2025 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263862; cv=none; b=LTDfdfFbjXYwY6sjzNYJBD2yargGjoh/FPLPI28TeoPqhkA/9XvvZn7xlYXoUaJBjvjfhY1AL2XJUWBoHuYoH3JheMcdqyNoc2NB8JFp4aSHpWiheP1LB0vCZnpQmXpZ83isfpipGsjhYhjTn2ixWIUa/JWv1RGADyUNlu1iQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263862; c=relaxed/simple;
	bh=nPEUkLQuTCnKzFy8MSgKWYwZL/qjTJBQ3LiLOBJxH9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBQKHOeQYCxRw69Hw3FvucK2obRJquC9xBbNpZ93St7/szcPvE7XFD/pUXb8p+2jKdsqWqp2E1Y2SQQdv4oX7u2O5QYWN+BOWwqWXC/kEaZrO1Kiu6nxSsSh470k1Rmh87mK59gMpulkRm/eOSYpJRF5t55OQAHtX62PuAW+BCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/2BMPL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/2BMPL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8498EC4CEE4;
	Tue, 11 Feb 2025 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263862;
	bh=nPEUkLQuTCnKzFy8MSgKWYwZL/qjTJBQ3LiLOBJxH9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/2BMPL8ITg3W+vwsqOhZDgc3p+WgOWSypkLXvMEoUDzsIVNWT6PS8rCIaWFTTBMT
	 sD4xnDyYqSBQGCDwtFCTz92INltl7e1L2dC7kR4ALhajLV7s3zdB/h7o5bfy51+Onr
	 GMr8C+nqtANyweRS+D6OAwad6zFXBet2yzC9gesihiqp97zJwVyLmeO/Lz34jeW8Zi
	 cLO7aieGg44iix/L73gZVy8SnacEW4OslTt65gvsc3/SCFkle1cJlmWlVG26TOoCvh
	 /oB+j+t4mCczm7i7acMa2A0uwaTj49CgoPhvWDmKnNtxaqi03DZ1viF9fD3B9dfGC+
	 jbxK3lqQ+ejFg==
Date: Tue, 11 Feb 2025 09:50:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: niravkumar.l.rabara@intel.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, nirav.rabara@altera.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: intel: document Agilex5 NAND
 daughter board
Message-ID: <20250211-acrid-tanuki-of-greatness-b58cd5@krzk-bin>
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
 <20250210074604.2410783-2-niravkumar.l.rabara@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210074604.2410783-2-niravkumar.l.rabara@intel.com>

On Mon, Feb 10, 2025 at 03:46:03PM +0800, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Agilex5 devkit supports a separate NAND daughter board.
> Document Agilex5 NAND daughter board compatible.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
>  Documentation/devicetree/bindings/arm/intel,socfpga.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

