Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389731E5B60;
	Wed, 30 Apr 2025 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746041954; cv=none; b=cbnyYVyS0bW4ka8c7JATxUGEkKI86BiGJoEOPYn89R0P1c7bcXXmxYqdv4PXGYn+3osesYMN3uY95bQli16Dq1wHVlaDW5TTZaCsZd7zA423Kel3tGEHzd6Duij0wJgOJtRKpIRZ5xxS4cwr46ZKhVSmp39oR9En3fzE9m+5ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746041954; c=relaxed/simple;
	bh=A5RfTs/henXYW1lD3nfgWav7+G4irmoGlcE9AyyQnqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=csm5WQTVAK1KfID7Ja1zFAgaXl2i1ToJZ/0Ll4Y6nx54avzBRiyqnfS5wF/7nqPWSBmSZ/a+9oid7O3z0lt1EQpmHtxXOHxcTGKuwAtLV5P6ycedRiRQQBtkSEt+Vj52b5SsT/Ruyv2Eso9FA47rf5FiUguJpdg2BfmHOJPXj14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnnZ9hff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnnZ9hff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666F2C4CEE7;
	Wed, 30 Apr 2025 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746041953;
	bh=A5RfTs/henXYW1lD3nfgWav7+G4irmoGlcE9AyyQnqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lnnZ9hff+GhLQFPjCWMr4ocKU2ubh3qsYbHP3MUOyJVt1ydAxOzJtJ+VoCM51qE6X
	 FTya9HhvjLDjdBnY28dis7vwvJoapHXw/y51mVL0eiYfADpOEHD6wpDCQ8Fmqup+pM
	 6K6UOqSey5xe3yKou4KmR3EWCQj1DS1Z7QJiIDmxNQHhwl38qHb1hWGnXimaxqa/sT
	 Fa3DuF9nigigBIkezshYH39lZbZLHziT80l0dOQGR88LVCC+oIzKfqEd+351lh/Ctk
	 6r7e7vSQ7tVFPruMgEvR2SjXwgeJOx3IVbg0IUTK6t4BAqv2KjnixYhH9BlU4GbqtP
	 uwC1+4EalkSsg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <edc7373f33955f6dc4c9e6268afcb1a40566b39b.1745840884.git.geert+renesas@glider.be>
References: <edc7373f33955f6dc4c9e6268afcb1a40566b39b.1745840884.git.geert+renesas@glider.be>
Subject: Re: [PATCH] nvmem: Remove unused nvmem cell table support
Message-Id: <174604195206.121497.8520830420812368104.b4-ty@kernel.org>
Date: Wed, 30 Apr 2025 20:39:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 28 Apr 2025 13:56:15 +0200, Geert Uytterhoeven wrote:
> Board files are deprecated by DT, and the last user of
> nvmem_add_cell_table() was removed by commit 2af4fcc0d3574482 ("ARM:
> davinci: remove unused board support") in v6.3.  Hence remove all
> support for nvmem cell tables, and update the documentation.
> 
> Device drivers can still register a single cell using
> nvmem_add_one_cell() (which was not documented before).
> 
> [...]

Applied, thanks!

[1/1] nvmem: Remove unused nvmem cell table support
      commit: 1656ca6bf14d582c05a99088e0f55265e76431e1

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

