Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E32F158535;
	Thu,  5 Jun 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124768; cv=none; b=FClQke6makFGE1XXyqGXl6Il8SPZfreq/VwADnE27A0Tk1PO/CPXvsRhkh6s3FcKtdfi/4jFR+2G23J1IFW9FQtjA3w0OGJZqBoYwn/pxpVC1tHz6kzYgq0c+wbr2hNVdXgrNefGG5ZpN6PfhCdXHkFg1mT4lCa8uPSlddPCi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124768; c=relaxed/simple;
	bh=J1zRzyeiV7k5I79S9NHUGOfYbI2/aT905ucRxxR8/cs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aAyXAZyxIvtRK2TDa3+iOywJZrxPfj9Enggc/MdnlQMY54eRPGPL6iKtCV09uqZTR4JnuC2GVB3R9B4ZIRSfmwgYMsu5SDD32c+MSalUjHkuxq9N7xmaqvcWJDPx434dw7iDR8CJixfoN17jYp/h6Xf1xiSBk1ycqXFLDvsmQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctE2cUN7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctE2cUN7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1396171fb1so448051a12.2;
        Thu, 05 Jun 2025 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749124766; x=1749729566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rIkbuU9MIg1PrrJpfy9RHNU8RZMR4iYh8YoeMDroNnY=;
        b=ctE2cUN7eYgggyuuY9dR0mYRkkyoQtDzc/ss1/+RbmnLEdb+8c3Sz9EZJzeLZZnIGd
         Z/egrUs0d1d9tLoYi+EtnEE8rk9IobYWSvrVMG0sEuFmpVLNAggXbwmKF5yTn0FDdO7v
         gdNf70YV9EKWHxDcRoWQGK9/9Ht2/NVv9gs0dee+UWH6Djl4PhscP43MUC5GgUk7lef1
         DJgUeC4TknyEu4U278CuEPP555SnVp/GXg/hcynk6jYDl9DLAa9nlfMyG3qbC+cK2wMK
         7wjjW2ODmVVGQGNDFY11EODwRAWwmQluGrwPW5usuquyQJwBFWaWoGxDIOmFKI9UD9UD
         1cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124766; x=1749729566;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIkbuU9MIg1PrrJpfy9RHNU8RZMR4iYh8YoeMDroNnY=;
        b=qTgOyi0TaDeVLiXTU+ObcjhjiOnfil26yLadJnJKfFX4v4RSEUIsOah5wjKFz3OhWi
         IW/f1K7TjRTR+oTiOzCgf6dCF6DiheJd6Sbp9F9PRlznvL4vW+y/+OTG2s0iv65EMSy4
         9aJXf5dnrlcAJ0NZQtEZySZ//MR6lF5dRMuUyF/yFHTlgyIzzKMjetsYypGr3i27+0HF
         xTzvDpcPKTiFv6gTqxmWSBjXQ1HR+ZuHDvK9OJLGgrcK/VZvgu7kVtwOLLosIyk+HU54
         1jwTTpd3MG0ler/KwHRRT17jDbzCb9TbxbTnhUR6zU8ufn/IpH4bI51M7MLQbEVvuCoP
         tFgg==
X-Forwarded-Encrypted: i=1; AJvYcCVAZC552IFxvjtgBv+5QumcsAWOOpDOYaMQ5ydxxn/AdoLGYVkScgcrPs8vunhBFy0U+PybR4q1b1w=@vger.kernel.org, AJvYcCXcbvTB7uB1vf77hzH2Jizc2PEF55TMxepDh0hRpln6ggIXuPs8jQJXFXFrdl14KEBNJaZuytVaMROYTgLB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nBFZrDGCo17UAFXisVhfFsgP7X46fDEsJpArX5L1FWAl8Sgs
	5F+EhlczpnnmO+H0zqQ7i8auyhc9iICQujmLauEcdwNnVgAOlsOZrO+/bmZaz5vo3wz9IFOulqh
	NM9L3DOnuaF1JFz8O0BwXFNWI85wk9Ow=
X-Gm-Gg: ASbGncurvIw/w14wnYWDyyYyWvEStv1k8ZktsnWyT4G8rDa3rZOwA4we6bZJxkG6uEj
	LV0t8eq8JtI293Qipot9ru4oWBJMI+Me2cr4g0kt+m3BqfSeBeetVrnsHsEpPhlcMVT1s7flRmP
	85HO1/kKh2fv1YVS+8EoSaSuqGG8wFi17qn65Z8VxNWMf55+3hg9v+EK+3VK+gYmZUZA==
X-Google-Smtp-Source: AGHT+IHA0zIkxjv8j/we/i66FUIVeZNHaeB/3YDFUdtxUtN42ZC2+2VF94CvNDyAGoOJSXj1cjYJvbT7bjv04MFoEYc=
X-Received: by 2002:a17:90b:2ec3:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-3130cda9edfmr7636962a91.23.1749124766305; Thu, 05 Jun 2025
 04:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sai Vishnu <saivishnu725@gmail.com>
Date: Thu, 5 Jun 2025 17:29:13 +0530
X-Gm-Features: AX0GCFtlRq6SQVgcsw74rHa3T5jXcqzq1xlefm4CRrThQgWxFmUF3Yarc1DIcT0
Message-ID: <CAFttn56VFPjikxjhgds6LjphinStm_cN+7ZhAzsieT0gnBqBDQ@mail.gmail.com>
Subject: [RFC PATCH 00/04] scripts: sphinx-pre-install: add interactive option
To: mchehab@kernel.org
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

This RFC proposes adding an interactive mode to the sphinx-pre-install script
to guide users through installing missing dependencies for setting up sphinx.
The goal is to enhance usability by prompting users to execute distro-specific
commands, improving the experience for developers setting up the documentation
builds.

Based on feedback from the initial RFC, this series restarts fresh to outline
the planned approach. The feature will take 4 patches to completely implement,
each addressing a different section of the feature.

Planned patch series:
1. Add --interactive flag and update the script's "Usage" message
2. Implement the run_if_interactive and other helper functions
3. Add a fallback to distro detection and verify the user's choice
    - Why? A user running Pop!_OS can utilize hints based on Ubuntu
     but the script will not detect and return a "Unknown distro" message
    - Add a package manager check for each distro-specific function to
     verify the user's choice. Avoids running harmful/unsupported commands
4. Apply interactive mode to distro-specific hints - Integration

Please provide feedback/advice if necessary. Patches are ready and will be sent
in 2-3 days after gathering any possible feedback.

Please provide feedback, especially on:
1. Whether to merge patches 1 and 2
    - They are both setting the starting point for the entire feature
2. How to deal with commands in recommend_sphinx_version()
    - Two possible routes exist to install sphinx
    - Available options: pip/pypi or distro-specific package manager
    - The plan is to add a prompt that asks the user to specify a number
     1 for pip, 2 for package manager, 0 to skip

Initial RFC
RFC: https://lore.kernel.org/all/20250410155414.47114-1-saivishnu725@gmail.com/
Feedback: https://lore.kernel.org/all/87ikn6bw34.fsf@trenco.lwn.net

Thank you for the time and response!
