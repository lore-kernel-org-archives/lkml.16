Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E42857F9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133793; cv=none; b=JLQ3TPWLaxH0XW2wjjQr5KXGqaAB9ZWxa218wfwAb1Ks13H6AIGHuDW0j52TKK7uuOptV9O1XHrw8EuiLb4dmQTOpHEkQwGj1X7D4r9FK5MPBJk8Y9BIuXpYsfpvYSxa4JPTaLzIxcRu+nFO1OdIT6YSWkXX4QXUSKQwvwSmcZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133793; c=relaxed/simple;
	bh=1XdDkMZogfepqvdGmwmMh8j2c8yP6amabx1PnZobGSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OpOKFkGqfxUR0qedCYMqH0RKE1jaFTBdGGUT/348hzyyXz8XXrFdsS5IbdhngVLn/kyk96vjuLpxh6wrR7IKBZ1JVjs7UknIevEbLpPbGTavQTqSqnBqz3vnXDUCj5qFKo3OIv+EEDtq/1DaWLqwku5eYbDoDFpIGbqxg3p6UtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTM6zQH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTM6zQH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5B2C4CEEB;
	Tue, 13 May 2025 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747133792;
	bh=1XdDkMZogfepqvdGmwmMh8j2c8yP6amabx1PnZobGSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZTM6zQH8HYaG5zwScQ3zwcoKEEUowulYLbxpWBPfWHz+a/QzCtAFzRzm2ZQeintLj
	 dII2eeUno+uHJsk3/QSFeHoQ6+bIGLQbAZ2gc8h0EiIckItiw+ma3/Wa+XYhoHdB/m
	 aYGpwsBOPSLIgd2zJfethgjIpMQDsjBHZEhcoQYQ1KUZqxGkeOQD+zzfZN9kbhdQiP
	 pqk0Z0d3bPbD8Pe1B3ODe7JI6KtWFwvnTXazskDhFTAgTkJ25/DC8Ac0kWOkK12uF0
	 htxRtDJd0tg6WmgfT62+B/r5Sus/HikiQszetbxrjaSo5/+XiPTrbSZDxNAQg8wub5
	 KSeoqu1WX6LJg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, linux@treblig.org
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250509173521.49596-1-linux@treblig.org>
References: <20250509173521.49596-1-linux@treblig.org>
Subject: Re: (subset) [PATCH v2] mfd: sm501: Remove unused sm501_find_clock
Message-Id: <174713379200.4190460.421206412000809441.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Fri, 09 May 2025 18:35:20 +0100, linux@treblig.org wrote:
> sm501_find_clock() was added in 2007 as part of
> commit b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
> but hasn't been used.
> 
> Remove it.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: sm501: Remove unused sm501_find_clock
      commit: b6d21359b036bf48ef94757b45cf691b89ec139a

--
Lee Jones [李琼斯]

