Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7681F4262
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271789; cv=none; b=Gq+R8wiYtBqGt92MWlartbNmrCIc8sFJ5iTaED5m/Rdwr7l3XetOyMyjludVjR4/Hy/23+I7GAVMFXh7orT0TmNgD4783qp4mb2hBM1e2W69buGXr7RWCcmCdbuLVBKy04ex//VrAknCdJI+DslBaHdEzFeqPHhUE8vDL+RVRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271789; c=relaxed/simple;
	bh=mm/P9dYMUsjdggE0Bz9a//PZdBSLXWdnB5J4maPmnT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CHGuGgrhLEiVr2oqxZ1jTmVyrh7cqGE4etksJsXE3iVXZClGvrx1mkoCjfAm7l0gZxRhnfiOOfl4KDKlbjclFs2IayENm0JVdUdZ6V95Evm3G4GBLV6qsliNRCntAg0Ty9zyzcY6uC2kK+SrjBiSzgOqGxI6D94o5A92HyPlc48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2XQPpVL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2XQPpVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380F9C4CEDD;
	Tue, 11 Feb 2025 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271788;
	bh=mm/P9dYMUsjdggE0Bz9a//PZdBSLXWdnB5J4maPmnT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n2XQPpVLM1Ade/kA0CapOTKcdl9LB4DQITywr+9RMYNLKFrmu8rJLelTnyV5T5tZz
	 ab5rEH6zEQ247ANfeaSwrAalLaHe+YUtNvqajVFPbNsAp229+1K9JViYlgpWoT8m4A
	 cmWjWUUY8OOgAVLXhgYFCaOnVSYNyRSXKRrnVw7fYoHdGQ7ZxvzaPX1bPYtmQqCUJc
	 lpiK31TGPJkJckzy6GlmhnUoNRaFea6lOAO7UqGt2CPRZEwA1sZaftb5DtwrZjJxR8
	 6oPcGU11q+McqiUDLD+38X+JnSzqBrIB8AU4ZuxFcPNi2Vp2qqFOkVS1svOC01grHL
	 HEqFXKQnaYzNA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: sort headers alphabetically
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
	(Tudor Ambarus's message of "Tue, 11 Feb 2025 09:30:53 +0000")
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
	<20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
Date: Tue, 11 Feb 2025 11:03:06 +0000
Message-ID: <mafs0seokyc9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 11 2025, Tudor Ambarus wrote:

> Sorting headers alphabetically helps locating duplicates,
> and makes it easier to figure out where to insert new headers.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
