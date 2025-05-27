Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DD1EB5CE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324728; cv=none; b=e1GuFLSYtSTp95hdhp5BTdaY4ATh7nfE2J9Uc3mkKMkuP4+rRuW8ELtEa32ECDNfc3/Tce6HbpDWDnBP7PEWRjWTgHPKqc6Lgl1arwfA1KKuNckoMeKo0eS4z4YyymXhZRghhwMLZj2qqSamTGVeBSpRVnWDIUazpRt2428+qn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324728; c=relaxed/simple;
	bh=0h4MToyMZi6FE1TFu8zlRTj8kxMLKoCJQR+vUO1Zo+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6z8zF9U3Lxyhnlcc/x2FqzyKP81t/k4+Gu4u3higst1fzrB5oZmQHJMLxrj3TQl0XP92eLaosn0Mhf7ZkzdPa2HMcNx7c4nQlaIJ1KIf5ngzru5/c9FmwiZI4tABWgTHL0KvRb8v/FYzVaO0R1wOELFg0xp/n3iI5tlAg7a4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R0hd4Lo3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R0hd4Lo3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad51ef2424bso585536666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324725; x=1748929525; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=R0hd4Lo3WYkT3Iyk5DCwvJIBTQndAZkhtQgNYIRb8n/+FrN+xHMqPB8Xu0mnwJlNq6
         qpp1SAPXiAZ5HrxCXJLia/M+U0qCs8RwArRXvuoHDyZh3hMZ4SOfFWxu2ngzB1VBtam9
         HZNp56aStJbmWCMLUWm28z3ogTeUJ468dCM5iaaqu9VvJrWRvTbCDeC4I7uiVd4WQo9c
         Igr6mnLkeTrJfj8LsgCbHCUHM4EUZ3tbC+jtgwqCAMr9Uc/CjiTHrPQktgE4X00kVEcl
         sqXScoa+MOEt8CZ/5Em33aGru5kiv4Yfw+pBQfHOdnPOCJ1qHrCfSbz5dRw/6x6MvHzS
         +5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324725; x=1748929525;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=Ezb2xzqCRxI9EmOUBnmwnWxGGaWm0I3ZEE/ksYOwC0H5b4fciB1fS29Iaax7iNcgE4
         qFul1TzVXMWUPnAOvnHgNpryeZvcAj/dXtTJPFPJPIOO+iwk3eX7o0DPzyMfKWdu7K0C
         aoekX+T2KcNDpfPFHJoRZnZHkiUwjkRFpLewkyjlJFC5csluBP8A8sgjQFCApo1blP20
         pfgUA/ivGD9s6s4NFN+/DGzqaWJwLPyVqznfzKBrGYxVAw58SGB8jCr7h0OYJzT6XjKY
         DRVpTxTJq6zEYVBA0IGXG41wqNVYSMi6707hGHF/TQNOCqGhKv708IBkUUvc4mjSqC/J
         XyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoH7Ol/awjwK4mYiZe481fRm1ddSt2V/1HZy/mIsfr02VoYxN3ZrL5sZl3YSnOHSAjg4nvJpdTy3VGg4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbmp6p0Mkio+C7JRtQV60e5He/AJd+y2Pr+fCeWJbqXQ12mLvG
	iZBKXJF2oaeG7CC9dx9yynxKYIsg89C4kBB8rqYt6NwPIGbIM83+wgS0v8wFthy2T0c=
X-Gm-Gg: ASbGncseVlvkN0KHybHfrwSD7HRIkr9B1wEewhSSWyuzUWsQZ72QbhyYz15mRIcZ+du
	VLARuQzD9+ZnsvML8o+ltSQntshELrbGAJz0X/XrfsGaryKWFwaqH1yRZ9r6yxvg55KGa+4R4Ph
	I7zAPJkzhOokOZNu1cKRCuHux5dF4d1lxAHhJw0HyzrRpDIMJi6rh9eRk5r3qdDkzAx2VRmTmBR
	cFCEcM7+tADAANv6jDSM3pNqP/tGbxWZhkXGzDIP67+hYKlXA4bcStGGiKD9hX/PEi7dYRBX/py
	e8AQsyfr/P5HxXiFyOWVe/L7vKJJ3iuHD0hISpwbDUgyftNgNL7+wcQIBnqxpzFbtcNAXYBIct0
	=
X-Google-Smtp-Source: AGHT+IFjfjGDL9+pR2wI6u63W8YFLk9uDG95aJV/jaoLvZt0KxL00PabZAJ4WGFqwimBN1PB88AkOg==
X-Received: by 2002:a17:906:f58b:b0:ad2:499d:dfdb with SMTP id a640c23a62f3a-ad85b1bd259mr1048071866b.26.1748324725279;
        Mon, 26 May 2025 22:45:25 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d047749sm1788284566b.8.2025.05.26.22.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:45:24 -0700 (PDT)
Date: Tue, 27 May 2025 08:45:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cpuidle: psci: Fix uninitialized variable in
 dt_idle_state_present()
Message-ID: <aDVRcfU8O8sez1x7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the first cpu_node = of_cpu_device_node_get() fails then the cleanup.h
code will try to free "state_node" but it hasn't been initialized yet.
Declare the device_nodes where they are initialized to fix this.

Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 3c2756a539c4..4e1ba35deda9 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -456,14 +456,13 @@ static struct faux_device_ops psci_cpuidle_ops = {
 
 static bool __init dt_idle_state_present(void)
 {
-	struct device_node *cpu_node __free(device_node);
-	struct device_node *state_node __free(device_node);
-
-	cpu_node = of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
+	struct device_node *cpu_node __free(device_node) =
+			of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
 	if (!cpu_node)
 		return false;
 
-	state_node = of_get_cpu_state_node(cpu_node, 0);
+	struct device_node *state_node __free(device_node) =
+			of_get_cpu_state_node(cpu_node, 0);
 	if (!state_node)
 		return false;
 
-- 
2.47.2

