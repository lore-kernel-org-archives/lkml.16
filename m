Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511321ACEDF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636822; cv=none; b=BDVrBjoolsLifSl9nVGpH/cggfBaDjL4bVSu7PlxNZsJ9qIszVuPlsvlZ7uzF0jrrFomG+zZMNqoZzqe0emG7qeUSykTAycMBfplDgkNdKjLRchdt0zRJq6cM1Qa3qwfaqtKd3oXLexXbDgvuuRwbZ6HTLBmPxyfIt/MsaD0iYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636822; c=relaxed/simple;
	bh=TMsZXcUywPujCsSRw4HH9su9Z9AEjDr4uzM4LVhCzAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCK7QYYdKCeUbR2mR3JnoammlS5U1AJzWHUmzRzI6HloTK+vILldIaaTSRPeEHcJBR+5C2wXcms+VkmaOS/Lmh77nvmEpkvtyr5w6Rb1hpWvXdM/7MgJGB7WJapWlJoSi+cwDt9GKHOl/GcGsCOIUyJ/v/dglzq7BbzJOO7BVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz6o9ucT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz6o9ucT"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e75f30452so25160237b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750636819; x=1751241619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVQ8EMAdEccHxXCbbgyW+fp2hkeAhkZriGFFCYXHijo=;
        b=mz6o9ucTWiJzfddwgmqk61WlF2euiFnQEnICv4wr4208DcqsdzhbSLOGwiMcqLBSWu
         eguhcA/pEdFaV6NblqgvAjGbRnMF1JqpVrM092Czt/sSRcT/olK4v+dwqUXaWZ+H7vnM
         H8DNdc005w3RJKPkQotTeuY0yotAwXtkEXdrKiF9h+DKI8FamzTGCgps6qm0/pw1vzx9
         Geeol4g3rEeziWmjbTFlRSkKVwR98hBQ/AyWNAdGRbCC4pWw+sYF1RzZi6YfUztcdBvs
         2rVg457A2uuwG5iWuZ6eh79a4iWzi/xPRR5UJnnBYVla0DMW8DQVJbaUOqVbiTfHrVuT
         587A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636819; x=1751241619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVQ8EMAdEccHxXCbbgyW+fp2hkeAhkZriGFFCYXHijo=;
        b=e0A03rJGbvM7DJi4fd05Xa9+iCSzr2+EV/vcGnJGalerUqroB/XkLHhtLghBf5lTc4
         GviQPcSA5wEn6puOvBrYRmuV9BkDqx3+RbySTNiyMS+XV1E4C/X3zERrtLETLEbtPRzr
         +j7bPuAeTgFsCV2EIYS8WnKvVZTGwIJLT1LSMHbHxksA71AuDM/eKGR1PK6gxDGQfxHY
         csYxmIjAYCZDMrN29iuYALSb8nidjRBecadJszwmQsrIqXy+5C9MvJ7VZNf/SySEeJFM
         79CA05W5rhCl7vjK95bXTORuMJnEZ38Ly5ogxU2sg1u1zHMd5dmJIXwO/kcVpv1O16GH
         WXHg==
X-Forwarded-Encrypted: i=1; AJvYcCU+0A2KnL0TA0YKQbJhcJ3cE5sUrvjWQrj9s6/n58rJjq55QsH5AHrlPGl1S3kAwn0Valpxto496gR9654=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT18dxkoIFjuXQulyPKcTd6nJk5L8nuNBLSlsb3coPOK0yzzaI
	hjZ5RdoIm5Q1hDRT2SN+iYCgdBS+0lchhHzqLQpcsPxGEoaTyuggN1cI
X-Gm-Gg: ASbGncsQNA3+Ubhfl2XHdnk8Z/rULALH7RydQMlN+6kMkMjGkhE+hWOAQCRq+y1zvd6
	rzR/G2gmSX/vmSuzRe/hG0Ju3CAjFNAlVBSuNZqKfJ1H+aWazpTPLqfudVYdm1QHi5BsjgyC/4e
	DKzTnlnRFT0cCmxoqoeslpJXHiYRALff7BYIbRHK4tMJEVC4mi13FOBnA1rdx4NkSSwLH5x/xo1
	P9DPEhxo5PCV/p4mq/p5UbCafjZ76aImcV8ZXUa1SK6fNP7tztd4uN5nLZkVpeePazYu15ENEUX
	fj3DUCecN8mim/GQuUzs72UgzpoeKYCXH1b/Vpzsf91xJv+3lxb7PZ2zsnT4BCYgKZ/O5ZBmzGI
	OEDnogxKhm0hFNYOxrCra+A==
X-Google-Smtp-Source: AGHT+IElvB3NcUAmY80qRbL6KgaIcTyyrp55/JzMAonUYocimfC2D1VCp3iAZRl9pWEIU2WnmZm8Qg==
X-Received: by 2002:a05:690c:3502:b0:70c:bd93:4519 with SMTP id 00721157ae682-712c65175f2mr145911947b3.21.1750636819131;
        Sun, 22 Jun 2025 17:00:19 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b9725esm13591637b3.70.2025.06.22.17.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:18 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] smp: Use cpumask_any_but() in smp_call_function_many_cond()
Date: Sun, 22 Jun 2025 20:00:07 -0400
Message-ID: <20250623000010.10124-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623000010.10124-1-yury.norov@gmail.com>
References: <20250623000010.10124-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

smp_call_function_many_cond() opencodes cpumask_any_but().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 7c8cfab0ce55..5871acf3cd45 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -807,13 +807,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		run_local = true;
 
 	/* Check if we need remote execution, i.e., any CPU excluding this one. */
-	cpu = cpumask_first_and(mask, cpu_online_mask);
-	if (cpu == this_cpu)
-		cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
-	if (cpu < nr_cpu_ids)
+	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
 		run_remote = true;
-
-	if (run_remote) {
 		cfd = this_cpu_ptr(&cfd_data);
 		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
 		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
-- 
2.43.0

