Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E61E9B19
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718116; cv=none; b=aDBjcl4bOxu0HIwtuevpOuyxoV1/LL8qW+TDVkCbq0IAXBnJoQjHYOWGTXXif8QpJ+W7sdcYFF32x93eqhK7Ld0Ra+6+UPKePKERRo9/VkM7NuKarh4pkPjs3zfZVJr87Wod8Qr27lb3mFD21cgXU+lzpkAKfBKsnNwb4v5E8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718116; c=relaxed/simple;
	bh=l9uDPeb1Op/lAHJBHz3/JUe5Uu5x4M5WwnU1yD8OyEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZs33QtTuMx3RPUe+rNwM8kw5kHInpTSVwp/nwiMmkvUu5jNBnAE2sAiSOVfLy5dMbw0R/dDPYhuFrid7TfkO14BKORiVgYt89t6NUI+ggS5P9q5+2xLCwFzz4TGazwQjyOCjiWgiO02IehR1kIG5fD+rAi+1VixFhsTzduTHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aXCGjr3o; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aXCGjr3o"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376e311086so6383273b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747718114; x=1748322914; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiysgefIEzUO5GCfnzINSaq9Lwavqid+wd8gv2MrulE=;
        b=aXCGjr3oAnmba8NWuijKcfoSXZWyGZ6nuFFSkRTlC/KTmWp93TpjIj2R364sotCvYJ
         2arRcrLKgVMLyP8uESmzFmfOGy61Abb/EyU9V/YlHYIBjFk9F7y+8TheMG1JwR7BtILA
         hR0I92eCrsMYos8c6XtVN6xIJlBSqlexMkudc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747718114; x=1748322914;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiysgefIEzUO5GCfnzINSaq9Lwavqid+wd8gv2MrulE=;
        b=oMnjeaMZJq+OHSyIC4wQeFFZqRZwie3xEbbo/gk2OQO7GLeGo3p+iHddy+vKTPVvL9
         VLvmkKnjyfrrP+AuHr7LIZcHqkH0+FPPTrm37hJB60xDFbshX5AvqNTnWku8a1pXPHfL
         UIYOwiwsa1o+GcxAHYWhKVF+7tvGoJG1Fb7ospL0qKfZYYC3iHy6rRyl9/DaDNMQ8/X3
         doo842AY/1S9uweSzagDv4y0cXonKaBqfSRT9+6YN6cxgbcH3DOEha7SC+ayUEAKaPhi
         UfG2al5mG+oKXAf4xRxzbgSyBqv1IEiK5jhxtt8tXCHnQzlXUB5o3GN5RnydTjOQFJpn
         E0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRX7uqtJ9Wl49C4HqkclZdISYoSorQAPyCalOkn/ZlJtq+MAZZXpP11IiAiotDftYGGaNiTenYzZwx9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgt6lGTxUc3PkVtyKPzf3XpD58x6hYF+vDsX54MJvt8NuPxjA
	MQdEb0AJQdYfVQR0JoH58ba2j209awip0pOdp011PYNSIRC+soU1G1+DkwGfNPLKzg==
X-Gm-Gg: ASbGncs2x8vjH08p1fZrQJpu5idodJI+381mcz7EAOkpyDsvmLGFzlmyJjbcGGxUCoh
	gG+FI1vydxpFtxgsHAJw61APPXVV8hnvSQPjF4/9vTcZdVV+SBEvLh2VsUjDQaGeM7V51muxNgz
	qoOtj5W6oSB1hHUaucINCX38bU8FILiB7r4LAeXi0OhT1J2XmuV8xJ4y6zS6K+Y6LWoNdA4wmSx
	j5lsrnkrkhNGLcZ+gz5MVArDD5ck1qX6W3MJ8M5s8qcWCeNp+jPrHT8pDRFlD+4wLYz8gfg6VHK
	7mjJ5BcthDaVNWY3G6H6EL5KtqEy7FnvtrS+4ePh63dPXmmMw5Ht9vM=
X-Google-Smtp-Source: AGHT+IEFKnPKfgX98qSEHZHOpRkj8MQwEVAPRNDz/Xu8YBp0YmRXN4XOaVXMD+HIcDb1EXD4aQWuig==
X-Received: by 2002:a05:6a00:2790:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-742a961837amr18032495b3a.0.1747718114140;
        Mon, 19 May 2025 22:15:14 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:451b:c9c0:8e9a:5e30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a338bsm7362953b3a.175.2025.05.19.22.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 22:15:13 -0700 (PDT)
Date: Tue, 20 May 2025 14:15:09 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	Matthew Bobrowski <repnop@google.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: notify: wake_up response waiters on release
Message-ID: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

A quick question, it seems that fanotify_release() wake_up() just one
waiter from the group->fanotify_data.access_waitq queue.  Why doesn't
it wake_up_all() instead?
