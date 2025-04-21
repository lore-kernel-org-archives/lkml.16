Received: from mail-io1-f97.google.com (mail-io1-f97.google.com [209.85.166.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAB218ABC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279206; cv=none; b=XwM3Lm5vrEYPnsQ1ibOaU1PbVxaRV8gailqO0yIlaW8pTSSU/RdhGo/MYizeQ0f+A3fTzhYTwE4qGZ83/FmFMOxVE1cd2WBXg07zeqeDvnekhp2oVptwvdu4h7QBisxhhMa3wqb+wmXAOsWy2MIElRMaOsdCpleKMUNblswuXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279206; c=relaxed/simple;
	bh=mcgOA6RJ6YcO2wxxjMR3tXWhG6Ehq/v0rWuRIp/xytA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhYu4BmYx+FjPw5iTj+VDULQLatEmVmQceFF4Y731N01Tl3wflMBOAhJ20IGsjF4BjrrqflyEhbwBS4yJKW+JgsuDEp/Y28NH6PX0f2Ax/wEvqMN2uUvuoOKyNhR9fou61fpKzLLj87QWsD0heglp9XKo15RaEsZfjizALwmCIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=V4SW4bgt; arc=none smtp.client-ip=209.85.166.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="V4SW4bgt"
Received: by mail-io1-f97.google.com with SMTP id ca18e2360f4ac-86135ac9542so142637239f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745279202; x=1745884002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8OfCdyPLDsCsG60ZcCmWO2IkmLngYrZyR838vN7s8U=;
        b=V4SW4bgt/w75J4mM/WOTvKvHz6HDgakGecW+kiuDh7WIoo6bzGJGr7pnnau9Qn/ueU
         JmQYIqjEKMSuUtbjA9vr6FjUm624DTf0v/F/4c0K1ejwoVgPY/F+aOWGkTV9WNhMrRvm
         z1dU4T8G3VZV0YPsOuROLqm+Qu8yMv2cCI8zH81rNxFPnT/IZyxG/Tv6Bf9ydPp79pKa
         SQ+axSv+qde91mUwx9OZyvS33Zgyx04nT3LkjUhN98Br2azO4RSiTPe4weuYxJ9fK6U0
         /TFNo7f88kzMsx/YFPwWM5Sw61OZPLD2Bn8oIK4ou2togYwkDHv7G/Yd1/tsB4ISmBXI
         Q7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279202; x=1745884002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8OfCdyPLDsCsG60ZcCmWO2IkmLngYrZyR838vN7s8U=;
        b=mSzJadj5rzcYL/OMkL1bZqE0Zuat5TtwOe7G4KpkGvxt55JioCobrkj03Jtf+r2f0U
         Z0xSRx3V3WY6o7Uk/HbCjU6uz9PgViwYtGH0EKj6MCTjp7e4PpU+cma6yDaMeHjIJou0
         FPKAov0Wggm77oiIs4XR+WogWigooZXeonZACY68O7XWKjBOBR7eKaObO2WKZ5ksH7vY
         YNm00yChEadwQZagwBZXICkUWU0IbbdAY71YUrNOMf5FGfFFE2gYuvb/qsKtkb2V7Nx+
         Ti1RrjHXOEVPqN+ONSj62M8br8PcklQhlM1NnE+cfwWcmaqQbAW7fhjuDy+T13VaCl3G
         5rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs8i3Sv9P+ZQ3CGhfcL5zGNgv1XXf7h1Unz9lpqzTAQC/06hGdQVremQSYIjdHtmmGvkRD2tfKUPsD+ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DcUrgwa+0fuejDxn0aV0nEgTBYTKWgMz/gsEaWfZhGgrKK7y
	mqTqFYGSxZ7gFfS38AGq+Me69EBMxof57Q2kxgmZAG07TKTYnf/OOKLJCFULdFYJB50b6pwg0jA
	9Zjze7YYJbqtzuMPBswTd9YWUiw3DHBlWtnlC7Qa9tJ0alp3G
X-Gm-Gg: ASbGncvPSpOYuai/EEvBWVgjnY95WKrtO0hhJ6D6roGOsG/vDlKTgpyED7XbK7qJIte
	UDRGAyiNG83J5evV9gbktq3eybHxhMAYJ3RJvo48MTYB1O/Qw0Wv+om4wDBWXDXJuW4RfZUvUla
	scqENV6Q56UOpCX8FznmAmLQUtJXT7Eac1dxikEOAxkwKlZz6SEIqsVtAaOlx+FNnR77xNjQLke
	lB/p85/SFMErgPUhoyvag0wGJRAmnoseyTSND++WGBoBI+/69nMIuZlMQTcwmM+2DkJ6S0p
X-Google-Smtp-Source: AGHT+IGNBKWm/sabUXkKBKqJtCQdg8fOpkWpAHWVtDPSNSz+vx6YbANCTyDZ3Puj8hONyu743OFhLRKS7ciF
X-Received: by 2002:a6b:4e0b:0:b0:858:7b72:ec89 with SMTP id ca18e2360f4ac-861d89f12d9mr1244904639f.5.1745279202358;
        Mon, 21 Apr 2025 16:46:42 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-861d963ba38sm30747839f.13.2025.04.21.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:46:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0157C340776;
	Mon, 21 Apr 2025 17:46:41 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id F3579E40835; Mon, 21 Apr 2025 17:46:40 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 21 Apr 2025 17:46:43 -0600
Subject: [PATCH 4/4] ublk: factor out error handling in __ublk_ch_uring_cmd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-ublk_constify-v1-4-3371f9e9f73c@purestorage.com>
References: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
In-Reply-To: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

There is a tiny bit of error handling code in __ublk_ch_uring_cmd which
is repeated thrice. Factor it out of the switch statement.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 drivers/block/ublk_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index f5d4593d5941931efa7bc7d2106830cd2981f4bd..31ebfdf52a8986e879c136ea546755a2fbe15315 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2095,22 +2095,18 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 		return ublk_unregister_io_buf(cmd, ub_cmd->addr, issue_flags);
 	case UBLK_IO_FETCH_REQ:
 		ret = ublk_fetch(cmd, ubq, io, ub_cmd->addr);
-		if (ret)
-			goto out;
 		break;
 	case UBLK_IO_COMMIT_AND_FETCH_REQ:
 		ret = ublk_commit_and_fetch(ubq, io, cmd, ub_cmd);
-		if (ret)
-			goto out;
 		break;
 	case UBLK_IO_NEED_GET_DATA:
 		ret = ublk_get_data(ubq, io, cmd, ub_cmd);
-		if (ret)
-			goto out;
 		break;
 	default:
 		goto out;
 	}
+	if (ret)
+		goto out;
 	ublk_prep_cancel(cmd, issue_flags, ubq, tag);
 	return -EIOCBQUEUED;
 

-- 
2.34.1

