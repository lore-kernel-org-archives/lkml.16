Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2182219A7D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398536; cv=none; b=uDJ8w6a5hkCfLwmAHQtUBIoqyouRX9gQsiSVljaCCJetFO1UgfZcFovknYrOmP36WTu6NAxMnoDDgPB7fAvfQp0vE5TFCF9vYfVURLoP7mXUOHJgJ2B7ZycO7qRp7jAYxh8vw2mXf7fWZMrf52Rrwd9jUsR16U9HVZv63UacfiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398536; c=relaxed/simple;
	bh=V8QkqaxQAQuLib4lqq1N57Z30hykUI80qoFkT3dO3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teKLdcwvIv1h0HkXqnrWVCwdrsfpHMII3gsXZbMQ5+xaO28H4h2CYTri1uprBEONg8l7Q3zrhWhSShU18bVWUI1JKfFh0XP3hKfo6lJnm4LXHJHYlS+L/7qzJctDafrUxP299DU5fV4dIOloxUjuyNXvLFrwj+A25UWHZVwg18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UNNNhMuV; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UNNNhMuV"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1073556b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750398532; x=1751003332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lBZelaHP5PPmkOntc4jTfDIo6tAIeer+XpixIir8SA=;
        b=UNNNhMuVDZ+We/cFGC69fE5rQ05UsYm1OrhWL+/LBlYdnwlC2uEJn4ws4MzxoLk2EE
         u/hKR+z5wHJ8sQumcLX9igKUut2iFA7LsBPL/TZkSTlEMtCURzf7xcV1vSEy71UkClOu
         o5EN21lxxn8FLhfrfekR0jse5DRfzBoxBbit4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750398532; x=1751003332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lBZelaHP5PPmkOntc4jTfDIo6tAIeer+XpixIir8SA=;
        b=mF7z//ufqVeMLg2/Hau/RZj/orzqdv45KROF/GBUMiAQyC7bmTQIhDL9f8+r6WbOfv
         YhQsHGgPOmUEhZAgjmMXwX1NaDwjA7olV7EMqvnHpsKo25VYkd3DB46DUZqVsr/irftQ
         96BaRnTxOARzmO+vCwEU3IA3uv/OeD/ztK6W9BtDJYgDtpe1RmpejKnnRDlWcDTcfGvI
         CZJmbmDOpsjsSPN/G2bwlS4pPseWMMzLr793ul9FbT6ZnaHkBQ2KYDYYuE1ZoRghfLYx
         53IV8O0KLDRRD2V2uvBazFd1QONQjE3h8P0MA9zJnEQeMfD2FlTTPtHSfPQQriI7dvHP
         1A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6zNjJnRbhjltUxIABNejDKkAacf7sdxDZMeHwReKguci8j9A1H03/OYK460puxdC8hdc4K4wO5Qm3jDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdutCt14IBlAtbJrCP11A1s2Mko9NBvr/Fa7Yj9ZIdDnideP/
	1VrcbMX4TnGqNzKk6b5Ke1zUzBw9gwMcX+mmoyE0FmXOHrlQJvgnSG9fn47NwB5cEw==
X-Gm-Gg: ASbGncuOpIX5fg6QJKS5bAUiZSNySMA6dMpu7i94YpBJdWtSUCVqUlSr8cIacs5GUF7
	Mb1krd/BbIno10jzo1HxpXWN0IMeDw1Ik0/ZhbhE74lMaVwC6GiliJDbjWkxEOT/e/z+fjnPeUg
	vu6G2BECrp1ZhjbCCh+/nIRIxUftsCTCo0rwpmHoLm4hzEeBEHvkC61iLkGfZUyClwvlQAvm1bc
	v3N15TxpDj9cIpTl87QV3wry+NLp1YyhvO78tX5QWhJx6TK7tNJxrmjPzLm2CFe2XXvOv9AXBTP
	hhS6EFcUZJ6B9nBveXrv16y5z+XTrMXgKNbIWZFBYM45BdIjJoUGVlZKa8iwmKF0k9fGO5XTaM3
	8
X-Google-Smtp-Source: AGHT+IFnwY3Uttwxpg43v/GRn75nmvSevZmO5+9GhZLPDpi3uUpewN6wR/MISTt/iaWqRSujZovrjw==
X-Received: by 2002:a05:6a20:7f8d:b0:21a:de8e:44b1 with SMTP id adf61e73a8af0-22026e6bde2mr3126942637.34.1750398531939;
        Thu, 19 Jun 2025 22:48:51 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:e574:cc97:5a5d:2a87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626333sm1142575b3a.73.2025.06.19.22.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 22:48:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:48:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	Matthew Bobrowski <repnop@google.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <osoyo6valq3slgx5snl4dqw5bc23aogqoqmjdt7zct4izuie3e@pjmakfrsgjgm>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
 <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
 <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>
 <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>
 <76mwzuvqxrpml7zm3ebqaqcoimjwjda27xfyqracb7zp4cf5qv@ykpy5yabmegu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76mwzuvqxrpml7zm3ebqaqcoimjwjda27xfyqracb7zp4cf5qv@ykpy5yabmegu>

On (25/06/20 13:53), Sergey Senozhatsky wrote:
> On (25/05/26 23:12), Sergey Senozhatsky wrote:
[..]
> Surprisingly enough, this did not help.
> 
> Jan, one more silly question:
> 
> fsnotify_get_mark_safe() and fsnotify_put_mark_wake() can be called on
> NULL mark.  Is it possible that between fsnotify_prepare_user_wait(iter_info)
> and fsnotify_finish_user_wait(iter_info) iter_info->marks[type] changes in
> such a way that creates imbalance?  That is, fsnotify_finish_user_wait() sees
> more NULL marks and hence does not rollback all the group->user_waits
> increments that fsnotify_prepare_user_wait() did?

No, that doesn't seem to be possible.  Sorry for the noise.

My another silly idea was, fsnotify_put_mark_wake() is called in a loop
and it tests group->shutdown locklessly, as far as I can tell, so maybe
there is a speculative load and we use stale/"cached" group->shutdown
value w/o ever waking up ->notification_waitq.  Am running out of ideas.
