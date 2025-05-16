Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A71D19E96A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747438533; cv=none; b=Sdvl3UfHoAgJHnnyB+F4PkljRnMun34sde69ommCaYZUwq1x77hiv0J7y+xY/cUVJ2vqkfwlkCK5JiK/nYGMui9F8kIOmy14KFHnZwrWX2zU+EjPRbN0vJx+W+BdBQ54XhRSE/r5Hhfgcqez/1hHXvHyfEnVUKhqdMCvCgU4MGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747438533; c=relaxed/simple;
	bh=/hBsThQoaPkobM8+nOW9Cujp1n7mBA9UvS5O8S7ZSMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJRftPb/fN+JRjNLRTCwOKhCz6cKBkm3qfcYIq4k73CTuF9HTJaELLC1PONdWZ7OxBVs/Nt5WHMKeGSqVD4bS+3jDs73ImewN3O5JjPVzacE9gBO6whN5X4/kWYaA4fjlGizDpkxPBlQGyYwC5erdmS9Pzyx5WjC9aFpcsX5BDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PekBFNZW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PekBFNZW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e98f73850so2632248e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747438530; x=1748043330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/UJ81NU6SEe9/os128VngMenn6RX/mPtCB9eJUEZR0=;
        b=PekBFNZWbPKkIkU37uUtW+WeY83FW3bYEJa92zWjQx8QiaRMHUBgjjMT4N/nMa1l+t
         UhsKVcj960H+5Z+1OKcOup7PJYv8SPufmJXMFhEdt4FgIXkD8+p+r78kKXIvdKYW1XzZ
         jrKs9G4zG4p0/diQqZEr/WaSIrbstJn0FOVYQ5SjfkNG274pVZbkibzAS78V1TcuJSKW
         fIHnlHMgVQlnmR3OUlSABIuA5l8BfPJeiIURjDt9TwoFsglV/1+bXE2T08BLJ6BIBnlI
         wdg3LVMgNsIqL8p9spbCtEqrBgzk0TaBDAJZvDLCwRnj2GA4zkXQMcLaWREo+GrJNE8j
         5Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747438530; x=1748043330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/UJ81NU6SEe9/os128VngMenn6RX/mPtCB9eJUEZR0=;
        b=GkZeG+07WSgfkeP/8Jv9vrkVfmE6Qe7H0QWHGjoVy4SXxuYb55nVNYJoJW7mQfBIad
         3SC27yRfrjqz3WVCheyMMEYzI9of0fjC/zP/KRKP6G6Jjg7otFKjkVjbomSTJkeQYE28
         PYq6AFkHnGj7acUfDaNmbBrDmYa7UtpB5dxSs3Dk2bYI7wy8N4H0y3W++x7OzbLEhic1
         HyFqLzJ4Z5fuIqvEHnXQTje7HgYe1wYKWW+2qXu3eUq6/gx/paDYSakAgMJqnw65boKx
         GY6wLNDkQ3R4r6nmdppROs+7v7ecZq3z2dx0BjQUWiEk1ORCSCqRwHqAmXWBjK9bwvSj
         rsEA==
X-Forwarded-Encrypted: i=1; AJvYcCXxofHqemM7P/kLRt5hh7fnw3+YM1Uryg9AYNJ0E2k73MA/GrPqrGxPtVQ+CL49URSt+8QyERAy0iK8IJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQPMl2vavXBk77j6spXjZJ+tKSLeCPMcqHYMmAEeY38n1ESA6J
	sGCDKCI4RJx1gXIjkZGG9V7kJzsrg6fSWg60nqc5mV15fKqNO1AHw7St4s0E+xiXQM4=
X-Gm-Gg: ASbGnctvqwqr9WkimoiUPisOLWZgpEj22JdC1WH/+F13NDQYjja+5N2qQ5cpSGAvlwt
	G+esyoGBrHTJes0q0X8hWVLMT0RZu0aZkCjIM426phSn9UvuX7qrz9pRSw60HkdDsHF05qxIGjw
	1gUOPwqGYPPrg6tq3hOjGzYvEFVgjySWzhdijr93uzKOqOTo9MKzzHSXJdxkF5/6RjXkd5m3TP+
	+u652uaxzxdXqubDZhRSZCyxUuySKS5ZQnAAtVGo+YQyTXG0Rm5LUzl9kQatc9sxgG0Qdmt+VLB
	VD5XJbfHnePI2RNHvObvJDt6sTqTkA5gcUROgL4KNLa5KZh7OGvCPi1+c2zgxsKTolAS
X-Google-Smtp-Source: AGHT+IEQC4DeuYTJhufYSI6129vfrr80bHmVfYOe0SjjWY523RPLnpdKb5yhbp53P0ChZXzr9q90wA==
X-Received: by 2002:a05:6512:2613:b0:545:652:109 with SMTP id 2adb3069b0e04-550e7253122mr1527825e87.51.1747438529935;
        Fri, 16 May 2025 16:35:29 -0700 (PDT)
Received: from danyaPC.localdomain ([192.145.30.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca251sm5952871fa.38.2025.05.16.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 16:35:29 -0700 (PDT)
From: Daniil Ryabov <daniilryabov4@gmail.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Daniil Ryabov <daniilryabov4@gmail.com>
Subject: [PATCH] drm/amd/display: fix typo in comments
Date: Sat, 17 May 2025 02:35:16 +0300
Message-ID: <20250516233516.29480-1-daniilryabov4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix double 'u' in 'frequuency'

Signed-off-by: Daniil Ryabov <daniilryabov4@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
index 681799468..d897f8a30 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
@@ -1393,7 +1393,7 @@ static void calculate_bandwidth(
 						if ((bw_mtn(data->dram_speed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_margin, bw_int_to_fixed(9999)))) {
 							/*determine the minimum dram clock change margin for each set of clock frequencies*/
 							data->min_dram_speed_change_margin[i][j] = bw_min2(data->min_dram_speed_change_margin[i][j], data->dram_speed_change_margin);
-							/*compute the maximum clock frequuency required for the dram clock change at each set of clock frequencies*/
+							/*compute the maximum clock frequency required for the dram clock change at each set of clock frequencies*/
 							data->dispclk_required_for_dram_speed_change_pipe[i][j] = bw_max2(bw_div(bw_div(bw_mul(data->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->active_time[k]))));
 							if ((bw_ltn(data->dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max_dispclk))) {
 								data->display_pstate_change_enable[k] = 1;
@@ -1407,7 +1407,7 @@ static void calculate_bandwidth(
 						if ((bw_mtn(data->dram_speed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_margin, bw_int_to_fixed(9999)))) {
 							/*determine the minimum dram clock change margin for each display pipe*/
 							data->min_dram_speed_change_margin[i][j] = bw_min2(data->min_dram_speed_change_margin[i][j], data->dram_speed_change_margin);
-							/*compute the maximum clock frequuency required for the dram clock change at each set of clock frequencies*/
+							/*compute the maximum clock frequency required for the dram clock change at each set of clock frequencies*/
 							data->dispclk_required_for_dram_speed_change_pipe[i][j] = bw_max2(bw_div(bw_div(bw_mul(data->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->mcifwr_burst_time[i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->mcifwr_burst_time[i][j]), data->active_time[k]))));
 							if ((bw_ltn(data->dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max_dispclk))) {
 								data->display_pstate_change_enable[k] = 1;
-- 
2.43.0

