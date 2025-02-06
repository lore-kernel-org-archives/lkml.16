Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A31E5B75
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858893; cv=none; b=TJeMG7LakxNS/rwS+/CNSYu8nQIywPSOzHmNkHWG4mo1jiLgrZ6BQtC+ZMCZli0f66meScOKqEUUJY+n7X1wACdWy7c2WF/Kel7O2RMRcSOSB/XfXmJQuqDsIhU5jZjBnWnj5XPIv9LU3llwK/bi/WslCRFI5KclVFSnQDCI+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858893; c=relaxed/simple;
	bh=3f2AQwf+FirNCD+WQEGezQ/VqOhZOkNyM1peyGNyMq0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BZb7K2jZyAu5Fj/oPSM5aAzWFaOPVXcui1yUsGkuUEVHe/q4Ys8QkPUdn5kyjHhAXY1VAKjxXxXjvmZCcMq0aNztxdrIPzY+tkrZnyDB0IYi3akONkGQ1l/5rC/qTgVc2pkfNKCOmxZDrbyq0/kLtnu/GZa+Z6kwmN6Q92+1SZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHGGWetq; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHGGWetq"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2b7cd4d784dso498182fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738858890; x=1739463690; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lvt7nUdJS3KvOnpvNUn20I75AD5aVlCTcSCOr6Y1gHY=;
        b=EHGGWetqqIB2HcgKwBHVny3R8FheMt+AG8rAGFPJhzvKLAORkpHJfCOgzY5bM3jzT4
         otTcLaqG8uCntisardnj7o4tRWMDUrakGIYI1li8ohcTFaa44BeUf4D1GEg9i4APEu6K
         wrN3ehT6XreRxPumHjSgkVmLW6KaYfKxzIScfC9b+v2d9Fg5QfRUnxyJ7rqnZ983Kf0S
         Hl+lp0YUDnE20IBDCsQ1EbqBdiaNs/gAcKEj+BjubgK8TZTW49Po+gq1C+pbS5JY8svL
         g5Bm1vS6Y6EDJdZosX7q35ROwNwjdVcPvpNqt7ki5fqClVPIMT8mVOBQ7zCeOzS2MyGp
         pQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858890; x=1739463690;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lvt7nUdJS3KvOnpvNUn20I75AD5aVlCTcSCOr6Y1gHY=;
        b=HfMSLNspmg82mrNtd9SQdBl0NnR3YP6q2kcyj2/Pqq6E3mwIlVlpYt3cIUdHoSRjQZ
         YnKiI7RT3E85d9gJrlMSqAE8kIsmK49G7mi+SQU0aRhlJ3GeitIL9G/GYks3AInsTKiC
         d7Xi8+ZyojE6nFxY40qe39Srk4OcXTUOv86Idlw5eDEh3HzS2b1/z5jIOSE2WeaQ1c3R
         iY+nPa6t4cEYToVhbfn2FnbViyrFJ01mMHcP1UXoMMpxe//e2LRFmdySW8pKbGoxQ3bi
         +sfmamkE6VNKr8loq3gJLkdWoDNfj1wdGx30JVVPGsdje7ZVMgj0o4iFsI3bTH0d3l4s
         c2lw==
X-Forwarded-Encrypted: i=1; AJvYcCW7hiLXxoeVMlV/Ttf1/acZ3Q0R5HU7gjShZmdnzmJOH5hedsKLPmpuZZ0IWm+2baa71Kqs4w8XAFzC5jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaeMUSC/5INn+SxzdfapQGLA/c1Y0Bc7moEjclg91YnJQPmFO
	5pDvil35EjpvDdqYvJ3T/fFqwMqNJ8cGxJZP3j929A/bvm0N3WyUWkpKhb4rRnzL7zk2/UhGrJS
	T3o9Lgy8kiB8C/hH7haXdvps4UalUfPZM
X-Gm-Gg: ASbGncuFLdAi3AKzmdB6GxxLBHRIxLTie5G7qlQR3ibMAdGrUVAV5bx6SwBSK9T6P9h
	YNd/84F8fKY9Eh8URR2fRE89G5ipyUJ9wC+f+3b8Q6Er98JKpTB2iPKZM30258IaicunU+3RqNU
	g=
X-Google-Smtp-Source: AGHT+IFQpEVlEsa0KA37DNjyjds4wwXZWmv8r/1aSRXLSrJ/4ukHTzG5b0pQyDeBJnUivbG7B3mUV2pqdfPjj0vl9Ig=
X-Received: by 2002:a05:6870:6c02:b0:29e:49b3:c527 with SMTP id
 586e51a60fabf-2b8050bb4f6mr4802101fac.24.1738858890554; Thu, 06 Feb 2025
 08:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 6 Feb 2025 21:51:19 +0530
X-Gm-Features: AWEUYZn95MRDbrPxrpCfwrbSkaPWY60aq_88Xn-CyVu8ofk3lP3gmXsWmYzUmfY
Message-ID: <CAHhAz+hE60nBn6Fn3k-ABO5T9USS08fYZhCrZ+n0KGzvACamVw@mail.gmail.com>
Subject: soundwire : LnK SoundWire Protocol Analyzer on Linux
To: alsa-devel <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I hope this message finds you well.

I am planning to use the LnK SoundWire Protocol Analyzer on a Linux
platform. However, I am uncertain whether the current Linux kernel
includes the necessary SoundWire drivers to support this . I would
appreciate any guidance on how to use the LnK SoundWire Protocol
Analyzer with the Linux kernel, as well as information on the specific
device drivers required.

Could you please provide details on:

The compatibility of the LnK SoundWire Protocol Analyzer with the Linux kernel.
The steps to set up and use the analyzer on a Linux platform.
The necessary device drivers and any additional configurations needed.

Thank you for your assistance.


-- 
Thanks,
Sekhar
