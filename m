Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE72E62CA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804971; cv=none; b=tmBjrEX5OaD7dtUzYwZrfh5ARIEu4i7N0u2h8FU7MnzM4lRYZJ5heBUvTEdMFsuS7/GBw303vFZ4rMDXJdLy1nGUBY+l6KIYuduljn7UlznwO/H4IYpjiAaZIEUWrWrNdMQX4e87IRrZ6bVeYO8BtAlGzm7oYPXH6NkLeeaExzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804971; c=relaxed/simple;
	bh=Ja0PfHImKJ/xr9Tqcbp1+t1JkNqWqLnh1D0488QTX3o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TBkUHFzsv971kBGNlyfBBApz3+I2BZzMXvNrCJr/f1hZDgV40ylBHjydJ+1sGbrtWx6bMAv8objOHWnW9wxb04cixxDEN5L7+qhrj163iELTQvcPy4P9Z1A1nZtPhVn/8JVCc/DPbyeLqIO7w3PCAAbpwifd/AlpV/JzM89bzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahlE5omU; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahlE5omU"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476b4c9faa2so29423481cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743804969; x=1744409769; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8CAkyGY15pPzo3Ob4JRLPcNeGJT/GyOs2bCo2Gltd/A=;
        b=ahlE5omUgKnZor0JUMno9gAdPskj3bNj6bcLxglmRwCx4IL7R7w03FAzJW9T4aw/Up
         MOy4pjW69rz28eUb+oAXfhW96uAA3Q5F5qd94sqtybvfMc4iVeN6JuzWul+/2xQJs/sQ
         zeBAm4koY+isQGIYP+YC9jQePXSZiyNKZrBbGWY330kntpSMgaHaWbxYPBW2kEkiFbKz
         FEVPADjt0+Kb564rveiDpGNC3NNkqrcm0crMqwzZ6RwMmDiwXfoS4z0pgshfx6ZVxQ9z
         30KYvQ4ea3Z3WRyfmcoga89EWSelp91HqG6PoQqU9ZL8iUPodbIicHALPO/3wNMIOpTA
         jdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804969; x=1744409769;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CAkyGY15pPzo3Ob4JRLPcNeGJT/GyOs2bCo2Gltd/A=;
        b=U3/GW/fhOXRqVmffITZwrI0orhbnMoinEbda4UMtJURTS6Nv4dUS1FoniLiUueS6nL
         25wPEaCSdhSC8lDPG+t9VZYpeJ9+a/sC4EQ6K5QcwV1NgenPcJSBOh6Ja5Ia7xwHyCYU
         2kWxP9XMk/tAoswNkCTeDQozFZHrRBFGjxwLVEPj8wcz5usuVEk+ZjHOSb0xtYntYHWa
         iMh+d0MZmicTkNQob1utWIp5FedSDlgOfO6WdKiu0Xw+nHMmom4SSFxW6jRxDLPJQM75
         +yzxtosFMCFt5LtksCOctf5fm8NRNgOzCXqg0+MZfew4PA8WI2QpYjJqRDO2Acxxsk4N
         30FA==
X-Gm-Message-State: AOJu0Yzw1oXlsGHcikeJ+6YdyUm6KXJHyec+23JQiOIdjzjBcB5whsKr
	RfG1z0u6F0srTfORjJ9Cq0AqWUgZk+js3gia5t/FTBeosnxBH3UD5uMkHIg6s9sIl83gG5qQZZE
	F8uYnyR6Gn3bGEGVvW4r+oTD3ylfBM4gs
X-Gm-Gg: ASbGncs+erez65hcpebfLOCMg8xg87E2vCLVdVYhgb+0X3LHBvmRPkL/V5C7CTLm4N0
	CC3YGHBOEJvLGSyTO4nO4cThhlkvQXgdSbPgzMJlZzB3xFbqW/uEtgvntVUsTsco8IezNUgdTYY
	prAUJ5ejaSJIzLfcKLczAJ4/xwc6wQ
X-Google-Smtp-Source: AGHT+IFCZrNfCXz1DEKBPJUfRYbgOAzu1QEbNhZcgzI7DWr3K/GnGt7iGcArOV2mc0ZH+CTVAUXoSXt/XWcXi1uADoA=
X-Received: by 2002:ac8:5ad5:0:b0:476:923a:f1cb with SMTP id
 d75a77b69052e-47925a40700mr68942491cf.41.1743804968785; Fri, 04 Apr 2025
 15:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian Johnston <adrian3@gmail.com>
Date: Fri, 4 Apr 2025 15:15:57 -0700
X-Gm-Features: ATxdqUH80obcvqo-AzrGobUz-imKAehKn8WuBZdi1iY8smYEQ9kvM7_pPr7ZdkY
Message-ID: <CAMtebmLFx-NC82zstiF5rDk0c0TqVozPb7o+4KA_kxGsbi62HQ@mail.gmail.com>
Subject: ref_tracker
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

The kernel comes with a reference count debugger called ref_tracker.

And yet, every minor release of the kernel seems to fix another
reference counting bug that has already been shipped.  Often minor
kernel releases fix 2 or more.  I asked on linux-debuggers and was
told they aren't sure anyone is using this reference counting debugger
that often. Although I am told it is useful.

Can I recommend switching on this debugger on your staging machines?
This class of failure seems like the kind of thing anyone with
continuous integration should know about 20 minutes after merging a
patch.

Regards,
Adrian
