Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451A223DCD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441313; cv=none; b=o15AFNzwBqof1KZwlvXkVbi/dt+xFcMBMVToJhRDgPR3mTnvl6ZcvCibuwhgl0kDinZTBjnEr9jFXk391e858YNZaCPceLFmRnC+88C09jN+opIZD8XbRwh1Ov7tm0Wdnx+1h8xnrAWOLvqMZw45aKqqiTxv+3c8mG3myG09sm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441313; c=relaxed/simple;
	bh=FDIXACwz7puhDj4N6F5Bd/6AaX9aqxOydTQwoK7Bra8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcXPq/9Xs7EGE6bN9+xm81t2oW+yAx891DgYWiexdCdv74cexI/bWdJAUS5XDV5lqRSwrmwG3ypPM5FxQmKvKM5g65cKlG08bvF+fuQo5zql4fLkhIw9e/6t6hPPZCo9GiDY/GgkP2l0xAoVcLrHEq17xq55ZkFtkaM26Wj+O0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5UutlcP; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5UutlcP"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso73188986d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 00:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751441311; x=1752046111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0c41L9VTbYMrAm4t2oLCDW8W0XVr26QOniUyuOXhc8=;
        b=J5UutlcPDe+hnU0XKRuZD8AlnurqX4RgD/O1xCs05saazju4PkUa4qCPZd6aSL7Wog
         NdqX2KMuFskHSRKljO0/4IlgPEIq4L0LWaKIkEfAQ7kClnWxMjHEIBNvQaJ5SyOpcR90
         W2VCrKgKrxOUwpGU2DfCH91CRVVQtLamYYB3hf714M1YpLMJb00coCOys3/SxNc3/b6n
         PA/dcKSFq712lY1qiyHXTpbJDltfCxFNNJhePIkM0Jyt+3i9sb+A291GFacjvtV1oMT1
         5bSGiD5pXMvHMfC8Yj/NEWM8Me6e7ml67BWPRAuLPR8DyLLq498EtYQpwtfCk3vobkm0
         N34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441311; x=1752046111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0c41L9VTbYMrAm4t2oLCDW8W0XVr26QOniUyuOXhc8=;
        b=RMlf/8dLkLxGsolCt8lBhHsYXhwCe9iM805uaVkTo/UI54f1/LTBbNn+WljO5BnRKQ
         1kTWGax5Zt8VQ18AuANfJ9ZgCXWXcoP++4ccK9Rx5WLxXWjrH9VWnRNlPw8zJCWk6QTF
         yXO91RzUMLRkX/aMHL7alOgCgyavanBQr0+Ux+eSgK1uNjd18CYf6tTblPeo7RaxV8Oq
         GAhde8vNsXmUte2fJ7JVu5iW8Fu07jMxgZaf/uh5NNlchLt2RFvtkI5dntzlJzvoVmbn
         Ekhzs5JFQTAdq7WlIP0bE5kIHcbSXUjRTty6kWM1n/hXuVMzglya2DYwuWVwNLgQ3W8P
         7QWA==
X-Forwarded-Encrypted: i=1; AJvYcCVcK1GTTDaChSRPZErD3RhoUWt4ggE9HaflRwYGIDoOG1cvwqGWWaFjZZ73TvkAS2Vp3nB7/spiN0iqvLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2OHQx3EykKciqQGQspB7teg7xd1Hps4bLJaxyx/KivDTG2eNc
	tpvRAQlCQHnZUdltqLv6ie+ToiB/U+Aw3mPV1YJW5kqeY6EX0R1zbTtx
X-Gm-Gg: ASbGncsPfGcrCkztNcdIVjqvNdnhSxMsyN7iA8rN8tIaOnCRXe97s9LKeMK3Dk7Kh5p
	aXc/4/j3YsUc3ATd6zw07otKd/JG6MoMt0N8WHWbs+L0aYDMQjyNgV8G7HZMCByEGXh7tWq9AIj
	N10I+ffP80BLYBzWBmkNAhNe6OUPoCDVao0V3v7foDt8kacaxHu+isi+vG/As8JBy15wbhv+wKY
	u0EOVzwRY0yFtSPwHqt2++MqsMnpxtYhhaie1AGKWA+MV7uTyCk7K2fnkPGAKyV3/9Uuu5EgA53
	ejYeThQax9S/U1NYYInW779/L94rd5lyTB2vQv0Rx+952CzmfY0xiA1xk0zF+E6yU2QzRsYl
X-Google-Smtp-Source: AGHT+IH96QKpHxensxCFYjfvqCsEceqBocyK2U3z8xvgLq5e6wKTGkMZxTJ7mrG1s9+xfl5blen4TQ==
X-Received: by 2002:ad4:5948:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-702b1c04e2dmr24082656d6.31.1751441310668;
        Wed, 02 Jul 2025 00:28:30 -0700 (PDT)
Received: from Gentoo.localdomain ([37.19.198.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd77307918sm96615876d6.101.2025.07.02.00.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:28:29 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] tools: mm: Added modern version of shell quote and a stanza
Date: Wed,  2 Jul 2025 12:19:18 +0530
Message-ID: <20250702072801.10216-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three things precisely:

Replaced backquote with dollar-parentheses ...that is modern way of quoting in
shell script. Improved readability.

Added a stranza of missing/required command for the operation,in this case
gnuplot and that too in shell path.

And lastly,use "command -v" to search the command i.e gnuplot and the REASON
for that :

The -v option tell show shell will invoke the command specified as its
options.Basically to avoid dependency on something outside of the shell.It is
also execute command found in the PATH. Essentially, ignoring other similar
name stuff curated somewhere else in the system.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 V2: What changes from V1: Verbose changelog, especially using command -v to
 find the specific program i.e. gnuplot.

 tools/mm/slabinfo-gnuplot.sh | 44 ++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/tools/mm/slabinfo-gnuplot.sh b/tools/mm/slabinfo-gnuplot.sh
index 873a892147e5..6c9add4bb8ad 100644
--- a/tools/mm/slabinfo-gnuplot.sh
+++ b/tools/mm/slabinfo-gnuplot.sh
@@ -46,6 +46,22 @@ check_file_exist()
 	fi
 }

+# This variable could have space separated value
+my_needed_commands="gnuplot"
+
+missing_counter=0
+for needed_command in $my_needed_commands; do
+  if ! hash "$needed_command" >/dev/null 2>&1; then
+    printf "Command not found in PATH: %s\n" "$needed_command" >&2
+    ((missing_counter++))
+  fi
+done
+
+if ((missing_counter > 0)); then
+  printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
+  exit 1
+fi
+
 do_slabs_plotting()
 {
 	local file=$1
@@ -58,13 +74,13 @@ do_slabs_plotting()

 	check_file_exist "$file"

-	out_file=`basename "$file"`
+	out_file=$(basename "$file")
 	if [ $xmax -ne 0 ]; then
 		range="$range::$xmax"
 		lines=$((xmax-xmin))
 	fi

-	wc_lines=`cat "$file" | wc -l`
+	wc_lines=$(cat "$file" | wc -l)
 	if [ $? -ne 0 ] || [ "$wc_lines" -eq 0 ] ; then
 		wc_lines=$lines
 	fi
@@ -78,7 +94,7 @@ do_slabs_plotting()
 		xtic_rotate=90
 	fi

-gnuplot -p << EOF
+$(command -v gnuplot) -p << EOF
 #!/usr/bin/env gnuplot

 set terminal png enhanced size $width,$height large
@@ -113,14 +129,14 @@ do_totals_plotting()
 	for i in "${t_files[@]}"; do
 		check_file_exist "$i"

-		file="$file"`basename "$i"`
+		file="$file"$(basename "$i")
 		gnuplot_cmd="$gnuplot_cmd '$i' $range using 1 title\
 			'$i Memory usage' with lines,"
 		gnuplot_cmd="$gnuplot_cmd '' $range using 2 title \
 			'$i Loss' with lines,"
 	done

-gnuplot -p << EOF
+$(command -v gnuplot) -p << EOF
 #!/usr/bin/env gnuplot

 set terminal png enhanced size $width,$height large
@@ -148,26 +164,26 @@ do_preprocess()

 	# use only 'TOP' slab (biggest memory usage or loss)
 	let lines=3
-	out=`basename "$in"`"-slabs-by-loss"
-	`cat "$in" | grep -A "$lines" 'Slabs sorted by loss' |\
+	out=$(basename "$in")"-slabs-by-loss"
+	$(cat "$in" | grep -A "$lines" 'Slabs sorted by loss' |\
 		grep -E -iv '\-\-|Name|Slabs'\
-		| awk '{print $1" "$4+$2*$3" "$4}' > "$out"`
+		| awk '{print $1" "$4+$2*$3" "$4}' > "$out")
 	if [ $? -eq 0 ]; then
 		do_slabs_plotting "$out"
 	fi

 	let lines=3
-	out=`basename "$in"`"-slabs-by-size"
-	`cat "$in" | grep -A "$lines" 'Slabs sorted by size' |\
+	out=$(basename "$in")"-slabs-by-size"
+	$(cat "$in" | grep -A "$lines" 'Slabs sorted by size' |\
 		grep -E -iv '\-\-|Name|Slabs'\
-		| awk '{print $1" "$4" "$4-$2*$3}' > "$out"`
+		| awk '{print $1" "$4" "$4-$2*$3}' > "$out")
 	if [ $? -eq 0 ]; then
 		do_slabs_plotting "$out"
 	fi

-	out=`basename "$in"`"-totals"
-	`cat "$in" | grep "Memory used" |\
-		awk '{print $3" "$7}' > "$out"`
+	out=$(basename "$in")"-totals"
+	$(cat "$in" | grep "Memory used" |\
+		awk '{print $3" "$7}' > "$out")
 	if [ $? -eq 0 ]; then
 		t_files[0]=$out
 		do_totals_plotting
--
2.49.0

